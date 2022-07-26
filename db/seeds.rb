# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'destroy seed'

Product.destroy_all
Order.destroy_all

puts 'create product'

product1 = Product.create!(name: 'saucisson poivre', category: 'saucisson', description: 'il est bon mon saucisson', price: 3.0)
product2 = Product.create!(name: 'vin rouge', category: 'vin', description: 'il est bon mon vin', price: 6.0)
product3 = Product.create!(name: 'vin blanc', category: 'vin', description: 'il est bon mon vin blanc oui', price: 8.0)
product4 = Product.create!(name: 'rillette', category: 'apéro', description: 'elle est bonne ma rillette', price: 5.0)

puts 'finish'

puts "Total number of products: #{Product.all.count}"
