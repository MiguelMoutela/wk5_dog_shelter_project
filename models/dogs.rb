require_relative('../db/SqlRunner.sql')

class Dog

  attr_reader(:name, :city, :breed, :admission_date, :adopted_on, :adopted_by)
  attr_accessor(:healthy, :trained, :adoptable)

  def initialize(options)

  @id = options['id'].to_i
  @name = name
  @city = city
  @breed = breed
  @admission_date = admission_date
  @adopted_on = adopted_on
  @adopted_by = adopted_by
  @healthy = false
  @trained = false
  @adoptable = false

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
    RETURNING .*"
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
             admission_date
             ) =
            ( $1, $2, $3, $4
            )
            WHERE id = $5"
    values = [@name, @city, @breed, @admission_date]
    SqlRunner.run( sql, values )
  end

  def self.delete( id )
    sql = "DELETE * FROM dogs
          WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM dogs"
    values = []
    SqlRunner.run( sql, values )
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
      owner = SQLRunner.run(sql, values)[0]
      result = Owner.new(owner)
      return result
  end

end
