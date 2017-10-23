require_relative('../db/SqlRunner.rb')

class Patron

  attr_accessor(:name, :address, :email, :phone, :bio)

  def initialize(options)

    @name = name
    @address = address
    @email = email
    @phone = phone
    @bio = bio

  end

end
