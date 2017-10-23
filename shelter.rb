require('sinatra')
require('sinatra/contrib/all')
require_relative('./controllers/dogs_controller.rb')
require('./controllers/patrons_controllers.rb')

get '/' do
  @dogs = Dog.all
  erb(:"dogs/index")
end

# get '/students/new' do
#   @houses = House.all
#   erb(:new)
# end
#
# post '/students' do
#   student = Student.new(params)
#   student.save
#
#   redirect to '/students'
# end
