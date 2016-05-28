# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

courses = Course.create([
  {name:"Pebble Beach", location:"Monterey", price:400, url:"http://www.pebblebeach.com", image:"http://www.pebblebeach.com/templates/pebble-homepage/createjs/images/hole1.jpg"},
  {name:"Spyglass", location:"Monterey", price:300, url:"http://www.pebblebeach.com/golf/spyglass-hill-golf-course", image:"http://www.dhbailey.com/photos/DSCN0156.JPG"},
  {name:"Augusta", location:"Georgia", price:450, url:"http://www.augusta.com", image:"http://gotravelaz.com/wp-content/uploads/images/Augusta_1781.jpg"}
  ])


matches = Match.create([
  {title:"Eric's round of Golf", timeanddate:"6-20-2016 13:00", course_id:1},
  {title:"Jonathan's round of Golf", timeanddate:"5-20-2016 14:00", course_id:2},
  {title:"Kirby's round of Golf", timeanddate:"8-20-2016 12:00", course_id:3}
  ])
p "seed completed"
p courses
p matches
