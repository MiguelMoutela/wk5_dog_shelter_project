require_relative( '../models/patron.rb' )


get '/patrons' do
  @patrons = Patron.all()
  erb ( :"patrons/index" )
end

get '/patrons/new' do
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

get '/patrons/:id/update' do
  @patron = Patron.find(params[:id].to_i)
  erb(:"patrons/update")
end

post '/patrons/:id/update' do
  @patron = Patron.find(params[:id].to_i)
  erb(:"patrons/update")
  patron = Patron.new(params)
  patron.save()
end
