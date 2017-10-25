require_relative( '../models/dog.rb' )

get '/bowwows' do
  @dogs = Dog.all()
  erb ( :"dogs/index_sum" )
end

get '/bowwows/new' do
  erb( :"dogs/new" )
end

post '/bowwows' do
  dog = Dog.new(params)
  dog.save()
  redirect to "/bowwows"
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

get '/bowwows/:id' do
  @dog = Dog.find( params[:id].to_i )
  erb(:"dogs/show")
end

post '/bowwows/:id/delete' do
  @dog = Dog.delete(params[:id].to_i)
  erb(:"dogs/terminate")
  redirect '/bowwows'
end

get '/bowwows/:id/update' do
  @dog = Dog.find(params[:id].to_i)
  @patrons = Patron.all
  erb(:"dogs/update")
end

post '/bowwows/:id' do
  @dog = Dog.new(params)
  @dog.update()
  # @dog = Dog.find(params[:id].to_i)
  # @patrons = Patron.all
  # dog = Patron.new(params)
  # dog.save()
  redirect to "/bowwows/#{params[:id]}"
end

# database
# get /bowwows should show all bowwows
# post/bowwows should create new bowwwo
# get /bowwows/1 should bowwow for id 1
# post/put /bowwows/1 should update bowwow with id 1

# delete /bowwwos/1
# post /bowwwos/1/delete

# html routes
# get /bowwows/create show show create page for bowwow
# get /bowwows/1/edit should show an update form for bowwow id 1


# get '/bowwows/healthy' do
#   @all_dogs = Dog.all
#   @dogs = @all_dogs.find_all {|dog| dog.healthy() == 't' }
#   erb(:"dogs/index_all")
# end
#
# get '/bowwows/trained' do
#   @all_dogs = Dog.all
#   @dogs = @all_dogs.find_all {|dog| dog.trained() == 't' }
#   erb(:"dogs/index_all")
# end
