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

post '/bowwows/search' do
  adoptable = params["adoptable"]
  healthy = params["healthy"]
  trained = params["trained"]

  if adoptable == "on"
    adoptable = true
  else
    adoptable = false
  end

  if trained == "on"
    trained = true
  else
    trained = false
  end

  if healthy == "on"
    healthy = true
  else
    healthy = false
  end

  @dogs = Dog.search(adoptable, trained, healthy)

  erb(:"dogs/index_sum")
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

get '/bowwows/:id' do
  @dog = Dog.find( params[:id].to_i )
  erb(:"dogs/show")
end

post '/bowwows/:id/delete' do
@dog = Dog.delete(params[:id].to_i)
erb(:"dogs/terminate")
redirect '/bowwows'
end

get '/pizzas/:id/update' do
@pizza = Pizza.find(params[:id].to_i)
erb(:update)
# @pizza.update()
end
