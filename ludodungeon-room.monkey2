enum Direction
  SOUTH = 0,
	WEST  = 1,
	NORTH = 2,
	EAST 	= 3
end

class Room
  Field entrances:string[]

  Method RotateRoomClockwise()
 		local temp:int = entrances[0]
    entrances[0] = entrances[1]
    entrances[1] = entrances[2]
    entrances[2] = entrances[3]
    entrances[4] = temp
	End

End


class EntityGenerator
  Function GenerateRandomMonsterType:String()
    public string[] possible 	= ["ogre", "skeleton"]
   	public int random = Random(0, 0)
    return possible[random]
  End

  Function GenerateRandomMonster:Entity(){
    local monster:= new Entity
   	public int random = Random(0, 0)
    if random = 0
      monster.type 				= GenerateRandomMonsterType()
      monster.description = "There is a monster on the floor"
      monster.visibility 	= 2
    end
    return  monster
  End

  Function GeneratePlayer:Entity(){
    local player:= new Entity
    player.type 			 = "ogre genie ballerina"
    player.description = "You are a 1 inch tall BARBARIAN! No 1 foot tall! Noo.. wait. 1 never mind math is not my strong suit."
    player.visibility  = 5
    return  player
  End

  Function GenerateRandomTrap:Entity(){
    local trap:= new Entity
   	public int random = Random(0, 0)
    if random = 0
      trap.type = "trap"
      trap.description = "There is a trap on the floor"
      trap.visibility = 2
    end
    return  trap
  End

  Function GenerateRandomTreasure:Entity(){
    local treasure:= new Entity
   	public int random = Random(0, 0)
    if random = 0
      treasure.type 				= "treasure"
      treasure.description 	= "There is a trasure on the floor"
      treasure.visibility 	= Random(4, 9)
    end
    return treasure
  End
end

class RoomGenerator
  Function GenerateStartingRoomWithDoorIn:Room(direction:Direction)
		local room:Room = new Room()
    room.entrances[direction] = "door"
    return room
  end

  Function PickRandomOpening:string(){
    public string[] possible 	= ["door", "open"]
   	public int random = Random(0, 1)
    return possible[random]
  End

  Function GenerateRandomRoom:Room(){
    local room:Room = new Room()
    room.entrances 	= ["wall", "wall", "wall", "wall"]
  	public int open = Random(1, 4)
    for (n = 1; n < open; n++)
      int type = Random(1, 5)
			if type = 1 'deadend
        entrances[0] = PickRandomOpening()
      else if type = 2 'across
        entrances[0] = PickRandomOpening()
        entrances[2] = PickRandomOpening()
			else if type = 3 'curve
        entrances[0] = PickRandomOpening()
        entrances[1] = PickRandomOpening()
       else if type = 2 'T cross
        entrances[0] = PickRandomOpening()
        entrances[1] = PickRandomOpening()
        entrances[3] = PickRandomOpening()
      else if type = 2 'T cross
        entrances[0] = PickRandomOpening()
        entrances[1] = PickRandomOpening()
        entrances[2] = PickRandomOpening()
        entrances[3] = PickRandomOpening()
      end
    Next

    Local trap:bool 		= Probablity(0.3)
    Local monster:bool 	= Probablity(0.3)
    Local treasure:bool = Probablity(0.3)

    if monster 	then room.elements.add(PickRandomMonster())
    if trap 		then room.elements.add(PickRandomTrap())
    if treasure then room.elements.add(PickRandomTreasure())

    return room
  End

  Function Probablity:Bool(chance:Float)
      return Random(0, 100) > chance*100
  End
End


class Castle
  public
	Field map:= new Room[10, 10]
  Field start:= new Location(0, 0)

  Field entities:= new Stack<Entity>

  Method GetEntitiesInRoom:Stack<Entity>(x:int, y:int)
      Local location:= entity.location
      local result:= new Stack<Entity>
      For Local entity:= eachin entities
      	If location.x = x and location.y = y then result.Push(entity)
      Next
      if result.Length > 0 then return result
      Return null
  End

  Function SortEntitiesByVisibility:void(stack:Stack<Entity>)
    stack.Sort( FunctionSortByVisibility )
  end

  FunctionSortByVisibility:Int(entity1:Entity, entity2:Entity)
      return entity1.visibility > entity2.visibility
  End

end

struct Location
    Field x:int, y:int
end

Function CreateCastle:Castle(size:int = 10)
	Local room1:= RoomGenerator.GenerateStartingRoomWithDoorIn(Direction.SOUTH)
	Local room2:= RoomGenerator.GenerateRandomRoom()

  Local castle = new Castle()
  castle.map 	 = new Room[size, size]
  castle.start = new Location
  castle.start.x = 0
  castle.start.y = 1

  castle.map[0, 0] = room1
  castle.map[0, 1] = room2

  Local player:= EntityGenerator.GeneratePlayer()

  Local keyboard:= ControllerGenerator.GetDummyController()
End

class Entity
    field visibility:int = 10
    field type:string = "no type"
    field description:string = "no description"
    field location:Location
    field  actionlist:= new Stack<string>
end
class Controller

end

class ControllerGenerator
	Function GetDummyController:Controller()
  	return new Controller()
  End
end

/*

Random room generated with elements (traps, monsters and treasures)
“Whole room floor spike trap” - visibility:-2
“Room is dark” visibility:0
“Skeleton warrior” - visibility: 4
Wearing “Amulet of light thirst” - visibility: 2;
Near water then visibility +5
When wearer thirsty > 5 then visibility +5
Treasure on the Floor
“Amulet of shadows” - visibility: 2
Player choose action
Rotate and connect new room
Move to room

*/
