require_relative('../db/SqlRunner.rb')

class Patron

  attr_accessor(:name, :address, :email, :phone, :bio)

  def initialize(options)

    @name = options['name']
    @address = options['address']
    @email = options['email']
    @phone = options['phone']
    @bio = options['bio']

  end

  def save()
    sql = "INSERT INTO patrons(
    name,
    adress,
    email,
    phone,
    bio
    )
    VALUES(
      $1, $2, $3, $4, $5
    )
    RETURNING .*"
    values = [@name, @adress, @email, @phone, @bio]
    result = SqlRunner.run( sql, values )
    @id = result.first()['id'].to_i
  end

  def update
    sql = "UPDATE patrons
           SET(
             name,
             adress,
             email,
             phone,
             bio
             ) =
            ( $1, $2, $3, $4, $5
            )
            WHERE id = $6"
    values = [@name, @adress, @email, @phone, @bio]
    SqlRunner.run( sql, values )
  end

  def self.delete( id )
    sql = "DELETE * FROM patrons
          WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM patrons"
    values = []
    SqlRunner.run( sql, values )
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
      dogs = SQLRunner.run(sql, values)
      result = dogs.map {|dog| Dog.new(dog)}
      return result
  end

end
