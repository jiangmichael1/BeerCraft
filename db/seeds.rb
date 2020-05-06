# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Drink.destroy_all
Product.destroy_all
UserProduct.destroy_all
UserDrink.destroy_all
ProductDrink.destroy_all
Like.destroy_all

reasons = ['Bartender', 'Hobby', 'Shopping']
type = ['glassware', 'garnish', 'accessory', 'alcohol']

20.times do 
    User.create(name: Faker::Name.name, age: rand(21..60), reason_for_visiting: reasons.sample )
end

20.times do
    Drink.create(name: Faker::Beer.name, recipe: Faker::Beer.hop)
end

20.times do
    Product.create(name: Faker::Food.ingredient, category: type.sample, price: rand(0.00..200.00).round(2))
end

50.times do 
    UserProduct.create(user_id: User.all.sample.id, product_id: Product.all.sample.id)
end

50.times do 
    ProductDrink.create(product_id: Product.all.sample.id, drink_id: Drink.all.sample.id)
end

50.times do 
    UserDrink.create(user_id: User.all.sample.id, drink_id: Drink.all.sample.id)
end

50.times do 
    Like.create(user_id: User.all.sample.id, drink_id: Drink.all.sample.id)
end

puts "Seeds generated!"