data = {}
db.shipments

db.customers.insert([{
    name: { spoken: "Kjell", last: "Karlsson", first: "Charles", middle: "", prefix: "JR", title: "Dr" },
    orders:[],
    deliveries:[],
    shipments:[]
    interests:["dog", "diery", "horse", "tractor", "atv", "sheep", "giraff", "garden", "grasslands", "forest", "wood"]
}])


db.orders.insert([{number:"344291", state:"delivered", changes:[{what:"order item removed", item:"291928828182", cause:"out of stock"}, {what:"price change", item:"291111828182", cause:"got wrong delivery", from:"1300", to:"0"}]}])

Find products on current page?
Find products in category?
Find products in orders from last 7 days in sweden over amount 5000

let products = search("products")
let orders = search("orders").from.last(7).days.in("sweden").with("amount").over("5000")

'Tag system
Concept "Mithril" is "Material"
Concept "Ogre Axe" is "Axe", Worth:"120", Weight:"Light", Damage.Amount:"100"
Concept "Axe" is "Weapon", Damage.Type:"Sharp"
Concept "Weapon" is "Usable" has "Damage", "Worth", "Weight"
Concept "Damage" has "Type['Blunt', 'Sharp', Posion]", "Amount[0, 100]"

Behavior "Walk" is "Moveable"

Concept Ogre {
  is = ogre | monster | fearful
  has = "Ogre Axe"
  can = walk
}

if thing.is(monster) And thing.has(weapon)

local tags:= Tags.Create(["ogre", "monster", "fights with weapon", "can walk", "can be disarmed", "fearful"])
If tags.has("monster") And tags.not("ghost")
    ' Is monster but no ghost! Has tag monster.
End
Local sameTags:= Tags.Union(monsters, traps)
Local stillToCatchPokemons:= Tags.Difference(myPokemons, allPokemons)

Class Entity
    Field items:= new Tags()
    Field type:= new Tags()
    Field can:= new Tags()
End

Local monster:= new Entity()
monster.type.add(["monster"])
monster.items.add(["axe", "simple clothes", "silver ring"])
monster.can.add(["walk", "eat", "sleep", "fight", "heal"])

' How can this be made easy to read?
' Determine Possible Actions
' actors.Each( Lambda(actor)
' actor.actions = Union actor.InSight, possibilities if matching field type add actions to actor.actions
' End )

// Spatial checks:
// can be used with point, circle, polygon (which then checks all points)
// point.within("distance", distance, "meters")
// point.within("shape") <-- shape is a polygon, oval or circle
//
//
// collection("bullets).create("bullet").spatial("point", "position")
// render()
//
// search("bullets").where("position").
//

let rooms = castle.find.room(my.room.id).list("entrance").remove("state:closed")
let rooms = find("entrance.state").is("closed").in("room").in("castle")
let rooms = find("room").is("closed").in("room").in("castle")

database.use("castle1")
let rooms       = get("rooms").with("state:closed").except("state:open")
let players     = find("characters").matching.find("controllers").with("type:player|local")

//Set theory: union | intersection | difference | symetric difference | catesian product | power set
//Set theory: combine | intersection | difference | symetric difference | catesian product | power set


let adjecent_open_rooms = set.match(local_players, rooms)

// Sets:
// - Controllers.type
// --Player | AI | Local | Remote
// Player & Local
// ---Keyboard | GUI | Console | Joystick | XboxController | Touch
// So one can search

// Using sets:
// Form sub-set of set.
// Ex get subset: Set("cars").Subset("red cars")
//
//
//
//

/*
  Base Quantity
  Length, mass, time, temperature, substance, current, light

  Units
  minute, hour, day, degree of arc, minute of arc, second of arc, hectare,
  litre, tonne, astronomical unit and [deci]bel

  Derived Quantity
  area, volume, desity, spead, acceleration, force, preassure, energy,
  frequency, force, weight, pressure, work, heat, power, charge,
  voltage, capacitance, resistance, conductance, flux, flux density,
  inductance, luminance, radioactivity, absorbed dose, equivalent dose,
  catalytic activity

  Amount quantifier:
  tera, giga, mega, kilo, hecto, deka, deci, centi, milli, micro, nano

  Abstract Quantity
  value, string, angle,

  Derived Quantity
  collection of values, value in grid, value in stack
*/


let rooms  = castle.find.room(my.room.id).all("entrance").only("state:open")
let enemies = search("castle").find.room(my.room.id).all("characters").matching("controller").all("type:ai")

room = RoomFactory.GetEmptyRoom()
room.each()

bullet = BulletFactory.GetBullet("simple")

Global Global_RandomZ:UInt
Global Global_RandomW:UInt
function getUIntSequence(z:UInt, w:UInt)
  z = 36969 * (z & 65535) + (z shr 16);
  w = 18000 * (w & 65535) + (w shr 16);
  return (z shl 16) + w;
end

function SetSeed(seed:int)

end

function getGlobalUniform()
  local u:= getUIntSequence(Global_RandomZ, Global_RandomW)
  return (u + 1.0)*2.328306435454494e-10
end

Class Roll
  Field x:UInt, w:UInt
  Weight:Double = 0.5 '0.5 is no weight, 0 is to get lower, 1 to get higher
End

Function RollDice:int(&,sides)

end
