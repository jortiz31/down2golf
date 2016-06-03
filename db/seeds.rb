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


pebble = Course.create({name:"Pebble Beach", location:"Monterey, CA", price:400, url:"http://www.pebblebeach.com", image:"http://www.pebblebeach.com/templates/pebble-homepage/createjs/images/hole1.jpg"})

spyglass = Course.create({name:"Spyglass", location:"Monterey, CA", price:300, url:"http://www.pebblebeach.com/golf/spyglass-hill-golf-course", image:"http://www.golftripper.com/wp-content/uploads/2013/08/Spyglass-Hill-Golf-Course-Hole-4-3.jpg"})

augusta = Course.create({name:"Augusta", location:"Augusta, GA", price:450, url:"http://www.augusta.com",
image:"http://gotravelaz.com/wp-content/uploads/images/Augusta_1807.jpg"})

chuck = Course.create({name:"Chuck Corica", location:"Alameda, GA", price:150, url:"http://www.chucks.com", image:"http://www.alamedagolf.com/images/IMG_0890.jpg"})

coyote = Course.create({name:"Coyote Creek", location:"Morgan Hill, CA", price:350, url:"http://www.coyote.com", image:"http://www.thecrowleycollection.com/photos/CA/coyotecreek/coyotecr004.jpg"})

baker = Course.create({name:"David Baker", location:"Fountain Valley, CA", price:350, url:"http://www.davidbaker.com", image:"http://visitanaheim.org/sites/default/files/styles/large/public/blog_post/159270/images/davidbaker12.jpg?itok=8njtUB4d"})

presidio = Course.create({name:"Park Presidio", location:"San Francisco, CA", price: 200, url:"http://www.presidiogolf.com/", image:"http://www.presidiogolf.com/wp-content/themes/cloudstrap/images/home_hdr.jpg" })

sharp = Course.create({name:"Sharp Park", location: "Pacifica, CA", price: 60, image:"http://sfrecpark.org/wp-content/uploads/3-Sharp-Cover-Image-586x286.jpg", url:"http://sfrecpark.org/destination/sharp-park/sharp-park-golf-course/"})

cinnabar= Course.create({name:"Cinnabar Hills", location:"Gilroy, CA", price: 120, image:"http://www.cinnabarhills.com/template/homephoto5.jpg", url:"http://www.cinnabarhills.com"})

chabot = Course.create({name:"Lake Chabot", location:"Alameda, CA", price: 90, image:"http://www.golfcalifornia.com/courses/image/preview/17299.jpg", url:"http://lakechabotgolf.com/"})

halfmoon = Course.create({name:"Half Moon Bay Golf Links", location:"Half Moon Bay, CA", price: 80, url:"http://www.halfmoonbaygolf.com/", image:"http://www.halfmoonbaygolf.com/images/Internal/golf.jpg"})

bodega = Course.create({name:"The Links at Bodega Harbour", location:"Bodega Bay, CA", url:"http://www.bodegaharbourgolf.com/", price:175, image:"http://theaposition.com/rkaufmangolf/wp-content/uploads/sites/70/2013/01/Links-at-Bodega-Harbour2_Robert-Kaufman-1024x580.jpg"})

p bodega
p halfmoon
p chabot
p cinnabar
p sharp
p presidio
p pebble
p spyglass
p augusta
p chuck
p baker
p coyote
p "seed completed"
