require_relative( '../models/dog.rb' )

get '/bowwows' do
  @dogs = Dog.all()
  erb ( :"dogs/index_sum" )
end

get '/bowwows/new' do
  # @houses = House.all
  # I want to use scroll downs for cities and breeds
  erb( :"dogs/new" )
end

get '/bowwows/adoptable' do
  @all_dogs = Dog.all
  @dogs = @all_dogs.find_all {|dog| dog.adoptable() == 't' }
  erb(:"dogs/index_all")
end

get '/bowwows/healthy' do
  @all_dogs = Dog.all
  @dogs = @all_dogs.find_all {|dog| dog.healthy() == 't' }
  erb(:"dogs/index_all")
end

get '/bowwows/trained' do
  @all_dogs = Dog.all
  @dogs = @all_dogs.find_all {|dog| dog.trained() == 't' }
  erb(:"dogs/index_all")
end

post '/bowwows' do
  dog = Dog.new(params)
  dog.save()
end
