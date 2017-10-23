require('sinatra')
require('sinatra/contrib/all')
require('./models/dog.rb')
require('./models/patron.rb')

get '/dogs' do
  @dogs = Dog.all
  erb(:index1)
end

get '/patrons' do
  @patrons = Patron.all
  erb(:index2)
end

get '/students/new' do
  @houses = House.all
  erb(:new)
end

post '/students' do
  student = Student.new(params)
  student.save

  redirect to '/students'
end
