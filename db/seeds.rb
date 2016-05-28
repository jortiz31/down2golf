# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Course.destroy_all
Match.destroy_all


pebble = Course.create({name:"Pebble Beach", location:"Monterey", price:400, url:"http://www.pebblebeach.com", image:"http://www.pebblebeach.com/templates/pebble-homepage/createjs/images/hole1.jpg"})
spyglass = Course.create({name:"Spyglass", location:"Monterey", price:300, url:"http://www.pebblebeach.com/golf/spyglass-hill-golf-course", image:"http://www.dhbailey.com/photos/DSCN0156.JPG"})
augusta = Course.create({name:"Augusta", location:"Georgia", price:450, url:"http://www.augusta.com", image:"http://gotravelaz.com/wp-content/uploads/images/Augusta_1781.jpg"})

a = Match.create({title:"Eric's round of Golf", timeanddate:DateTime.new(2016,2,3,4,5,6,'+7')})
b = Match.create({title:"Jonathan's round of Golf", timeanddate:DateTime.new(2016,2,3,4,5,6,'+7')})
c = Match.create({title:"Kirby's round of Golf", timeanddate:DateTime.new(2017,2,3,4,5,6,'+7')})

pebble.matches << a
spyglass.matches << b
augusta.matches << c

p "seed completed"
