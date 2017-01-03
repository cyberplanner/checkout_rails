# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
Product.create!(title: 'Smart Hub', price: 4.99)
Product.create!(title: 'Motion Sensor', price: 24.99)
Product.create!(title: 'Wireless Camera', price: 99.99)
Product.create!(title: 'Smoke Sensor', price: 19.99)
Product.create!(title: 'Water Leak Sensor', price: 14.99)
