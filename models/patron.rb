require_relative('../db/SqlRunner.rb')

class Patron

  attr_reader(:id)
  attr_accessor(:name, :address, :email, :phone, :bio)

  def initialize(options)
    @id = options['id'].to_i if options['id'] != nil
    @name = options['name']
    @address = options['address']
    @email = options['email']
    @phone = options['phone']
    @bio = options['bio']

  end

  def save()
    sql = "INSERT INTO patrons(
    name,
    address,
    email,
    phone,
    bio
    )
    VALUES(
      $1, $2, $3, $4, $5
    )
    RETURNING *"
    values = [@name, @address, @email, @phone, @bio]
    result = SqlRunner.run( sql, values )
    @id = result.first()['id'].to_i
  end

  def update
    sql = "UPDATE patrons
           SET(
             name,
             address,
             email,
             phone,
             bio
             ) =
            ( $1, $2, $3, $4, $5
            )
            WHERE id = $6"
    values = [@name, @address, @email, @phone, @bio]
    SqlRunner.run( sql, values )
  end

  def self.delete( id )
    sql = "DELETE FROM patrons
          WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM patrons"
    values = []
    owners = SqlRunner.run( sql, values )
    result = owners.map {|owner| Patron.new(owner)}
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM patrons
           WHERE id = $1"
    values = [id]
    result = Patron.new(SqlRunner.run( sql, values).first)
    return result
  end

  def dogs
      sql = "SELECT * FROM dogs WHERE id = $1"

      values = [id]
      dogs = SqlRunner.run(sql, values)
      result = dogs.map {|dog| Dog.new(dog)}
      return result
  end

end
