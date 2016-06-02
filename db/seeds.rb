# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Course.destroy_all
Match.destroy_all


pebble = Course.create({name:"Pebble Beach", location:"Monterey, CA", price:400, url:"http://www.pebblebeach.com", image:"https://static1.squarespace.com/static/54eea209e4b01b969d2fc647/t/5519ff9ae4b06b4b5195b818/1427767195966/ormeau_golf_club_fairway.jpg?format=1000w"})

spyglass = Course.create({name:"Spyglass", location:"Monterey, CA", price:300, url:"http://www.pebblebeach.com/golf/spyglass-hill-golf-course", image:"https://static1.squarespace.com/static/54eea209e4b01b969d2fc647/t/5519ff9ae4b06b4b5195b818/1427767195966/ormeau_golf_club_fairway.jpg?format=1000w"})

augusta = Course.create({name:"Augusta", location:"Augusta, GA", price:450, url:"http://www.augusta.com",
image:"https://static1.squarespace.com/static/54eea209e4b01b969d2fc647/t/5519ff9ae4b06b4b5195b818/1427767195966/ormeau_golf_club_fairway.jpg?format=1000w"})

chuck = Course.create({name:"Chuck Corica", location:"Alameda, GA", price:150, url:"http://www.chucks.com", image:"https://static1.squarespace.com/static/54eea209e4b01b969d2fc647/t/5519ff9ae4b06b4b5195b818/1427767195966/ormeau_golf_club_fairway.jpg?format=1000w"})

coyote = Course.create({name:"Coyote Creek", location:"Morgan Hill, CA", price:350, url:"http://www.coyote.com", image:"https://static1.squarespace.com/static/54eea209e4b01b969d2fc647/t/5519ff9ae4b06b4b5195b818/1427767195966/ormeau_golf_club_fairway.jpg?format=1000w"})

baker = Course.create({name:"David Baker", location:"Fountain Valley, CA", price:350, url:"http://www.davidbaker.com", image:"https://static1.squarespace.com/static/54eea209e4b01b969d2fc647/t/5519ff9ae4b06b4b5195b818/1427767195966/ormeau_golf_club_fairway.jpg?format=1000w"})



a = Match.create({title:"Eric's round of Golf", timeanddate:DateTime.new(2016,2,3,4,5,6,'+7')})
b = Match.create({title:"Jonathan's round of Golf", timeanddate:DateTime.new(2016,2,3,4,5,6,'+7')})
c = Match.create({title:"Kirby's round of Golf", timeanddate:DateTime.new(2017,2,3,4,5,6,'+7')})

pebble.matches << a
spyglass.matches << b
augusta.matches << c
chuck.matches << a
coyote.matches << b
baker.matches << c

p "seed completed"
