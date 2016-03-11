# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Tea.create({name: "Earl Grey", price: 15, description: "Posh tea that's too good for you", reviews: "", stars: "*****", image: "http://ahmadteausa.com/media/catalog/product/cache/1/image/350x/040ec09b1e35df139433887a97daa66f/e/a/earl_grey_100_foil_tb2.png"})
Tea.create({name: "English Breakfast", price: 10, description: "The breakfast of one-time only world cup champions", reviews: "", stars: "*****", image:"http://ahmadteausa.com/media/catalog/product/cache/1/image/350x/040ec09b1e35df139433887a97daa66f/5/5/555_2_1.png"})
Tea.create({name: "Cardamom", price: 15, description: "For those too lazy to add teh cardamom themselves", reviews: "", stars: "*****", image: "http://ahmadteausa.com/media/catalog/product/cache/1/image/350x/040ec09b1e35df139433887a97daa66f/0/9/097_2.png"})
