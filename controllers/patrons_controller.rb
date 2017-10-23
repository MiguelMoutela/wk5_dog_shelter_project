require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/patron.rb' )

get '/patrons' do
  @patrons = Patron.all()
  erb ( :"patrons/index" )
end
