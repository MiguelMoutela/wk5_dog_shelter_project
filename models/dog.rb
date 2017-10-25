require_relative('../db/SqlRunner.rb')

class Dog


  attr_accessor(:name, :city, :breed, :admission_date, :adopted_on, :adopted_by, :healthy, :trained, :adoptable, :id)

  def initialize(options)

    @id = options['id'].to_i if options['id'] != nil
    @name = options['name']
    @city = options['city']
    @breed = options['breed']
    @admission_date = options['admission_date']
    @adopted_on = options['adopted_on']
    @adopted_by = options['adopted_by']

    @healthy = options['healthy']
    @trained = options['trained']
    @adoptable = options['adoptable']
  end

  def self.search(adoptable, healthy, trained)
    sql = "SELECT * FROM dogs
    WHERE adoptable = $1
    AND healthy = $2
    AND trained = $3"

    values = [adoptable, healthy, trained]

    results = SqlRunner.run(sql, values)

    return results.map {|dog| Dog.new(dog)}
  end

  def save()
    sql = "INSERT INTO dogs(
    name,
    city,
    breed,
    admission_date
    )
    VALUES(
      $1, $2, $3, $4
    )
    RETURNING *"
    values = [@name, @city, @breed, @admission_date]
    result = SqlRunner.run( sql, values )
    @id = result.first()['id'].to_i
  end

  def update
    sql = "UPDATE dogs
           SET(
             name,
             city,
             breed,
             admission_date,
             adopted_on,
             adopted_by,
             healthy,
             trained,
             adoptable
             ) =
            ( $1, $2, $3, $4, $5, $6, $7, $8, $9
            )
            WHERE id = $10"

    if(@adopted_on == "")
      @adopted_on = nil
    end

    values = [@name, @city, @breed, @admission_date, @adopted_on, @adopted_by,
             @healthy, @trained, @adoptable, @id]
    SqlRunner.run( sql, values )
  end

  def self.delete( id )
    sql = "DELETE FROM dogs
          WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM dogs"
    values = []
    dogs = SqlRunner.run( sql, values )
    result = dogs.map {|dog| Dog.new(dog)}
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM dogs
           WHERE id = $1"
    values = [id]
    result = Dog.new(SqlRunner.run( sql, values).first)
    return result
  end

  def owner
      sql = "SELECT * FROM patrons WHERE id = $1"

      values = [@adopted_by]
      owner = SqlRunner.run(sql, values)[0]
      result = Owner.new(owner)
      return result
  end

end
