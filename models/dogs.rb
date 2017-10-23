require_relative('../db/SqlRunner.sql')

class Dog

  attr_reader(:name, :city, :breed, :admission_date, :adopted_on, :adopted_by)
  attr_accessor(:healthy, :trained, :adotable)

  def initialize(options)

  @id = options['id'].to_i
  @name = name
  @city = city
  @breed = breed
  @admission_date = admission_date
  @healthy = false
  @trained = false
  @adoptable = false

  end



end
