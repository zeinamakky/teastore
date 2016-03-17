# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Tea.destroy_all
Tea.create({
  name: "Earl Grey", 
  price: 15, 
  description: "Posh tea that's too good for you", 
  reviews: "This tea is amazing!; I love drinking this tea with milk or a slice of lemon.", 
  stars: "*****", 
  image: "http://ahmadteausa.com/media/catalog/product/cache/1/image/350x/040ec09b1e35df139433887a97daa66f/e/a/earl_grey_100_foil_tb2.png",
  stock: false
          })
  

Tea.create({
  name: "English Breakfast", 
  price: 10, 
  description: "The breakfast of one-time only world cup champions", 
  reviews: "Wakes me up like no other; CAFFEINE!!!", 
  stars: "*****", 
  image:"http://ahmadteausa.com/media/catalog/product/cache/1/image/350x/040ec09b1e35df139433887a97daa66f/5/5/555_2_1.png"
  })

Tea.create({
  name: "Cardamom", 
  price: 15, 
  description: "For those too lazy to add the cardamom themselves", 
  reviews: "So delicious!; My favorite tea", 
  stars: "*****", 
  image: "http://ahmadteausa.com/media/catalog/product/cache/1/image/350x/040ec09b1e35df139433887a97daa66f/0/9/097_2.png"
  })

Tea.create({
  name: "Moroccan Mint", 
  price: 3, 
  description: "Supermarket staple", 
  reviews: "Nice and soothing; Makes me feel like I'm in Morocco; Not at all like the tea I've had in Morocco", 
  stars: "***", 
  image: "http://i5.walmartimages.com/dfw/dce07b8c-32c7/k2-_f4851fb6-ab00-4756-955d-7e1954e696c0.v1.jpg"
  
  })

Tea.create({
  name: "China Green", 
  price: 7, 
  description: "This gunpowder tea is explosive!", 
  reviews: "Served this at a tea party and it went off with a bang!; OMG I love this!", 
  stars: "****", 
  image: "http://ecx.images-amazon.com/images/I/418W5EfGD5L.jpg"
  
  })

Tea.create({
  name: "PG Tips", 
  price: 5, 
  description: "Popular yet subpar tea targeted towards anglophiles", 
  reviews: "Yuck!; Avoid at all costs; Really not that bad in a pinch", 
  stars: "****", 
  image: "http://p-fst2.pixstatic.com/506a1a61fb04d60a65000de2._w.1500_s.fit_.jpg",
  })