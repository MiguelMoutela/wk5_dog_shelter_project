require('pry')
require_relative('../models/dog.rb')
require_relative('../models/patron.rb')

Dog_1 = Dog.new({
  'name' => 'a dog',
  'city' => 'Edinburgh',
  'breed' => 'mutt',
  'admission_date' => '01/01/2000'
})
Dog_2 = Dog.new({
  'name' => 'another dog',
  'city' => 'Edinburgh',
  'breed' => 'staffie',
  'admission_date' => '02/01/2000',
  'adopted_on' => '22/03/2000',
  'adopted_by' => '1'
})

Patron_1 = Patron.new({
  'name' => 'Dog lover',
  'city' => 'house number, street, city, postcode',
  'email' => 'that email@address.com',
  'phone' => 'that phone number',
  'bio' => 'nice guy, nice house'
  })

Patron_2 = Patron.new({
  'name' => 'Also a Dog lover',
  'city' => 'house number, street, city, postcode',
  'email' => 'that email@address.com',
  'phone' => 'that phone number',
  'bio' => 'also a nice guy with a nice house'
  })

binding.pry
nil
