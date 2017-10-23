require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/dog.rb' )

get '/bowwows' do
  @dogs = Dog.all()
  erb ( :"dogs/index" )
end
