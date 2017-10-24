require_relative( '../models/patron.rb' )

get '/patrons' do
  @patrons = Patron.all()
  erb ( :"patrons/index" )
end

get '/patrons/new' do
  # @houses = House.all
  # I want to use scroll downs for cities and breeds
  erb( :"patrons/new" )
end

post '/patrons' do
  patron = Patron.new( params )
  patron.save()
end

get '/patrons/:id' do
  @patron = Patron.find( params[:id].to_i )
  erb(:"patrons/show")
end

post '/patrons/:id/delete' do
  @patron = Patron.delete(params[:id].to_i)
  erb(:"patrons/terminate")
  redirect '/patrons'
end

get '/pizzas/:id/update' do
  @pizza = Pizza.find(params[:id].to_i)
  erb(:update)
  # @pizza.update()
end
