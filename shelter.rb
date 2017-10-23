require('sinatra')
require('sinatra/contrib/all')
require_relative('./controllers/dogs_controller.rb')
require_relative('./controllers/patrons_controller.rb')



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
