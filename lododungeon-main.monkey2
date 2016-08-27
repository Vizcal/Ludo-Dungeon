enum Direction
  SOUTH = 0,
    WEST  = 1,
    NORTH = 2,
    EAST    = 3
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
    public string[] possible    = ["ogre", "skeleton"]
    public int random = Random(0, 0)
    return possible[random]
  End

  Function GenerateRandomMonster:Entity(){
    local monster:= new Entity
    public int random = Random(0, 0)
    if random = 0
      monster.type              = GenerateRandomMonsterType()
      monster.description = "There is a monster on the floor"
      monster.visibility    = 2
    end
    return  monster
  End

  Function GeneratePlayer:Entity(){
    local player:= new Entity
    player.type              = "ogre smasher"
    player.description = "You are a problem for most travelers you meet."
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
      treasure.type                 = "treasure"
      treasure.description  = "There is a trasure on the floor"
      treasure.visibility   = Random(4, 9)
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
    public string[] possible    = ["door", "open"]
    public int random = Random(0, 1)
    return possible[random]
  End

  Function GenerateRandomRoom:Room(){
    local room:Room = new Room()
    room.entrances  = ["wall", "wall", "wall", "wall"]
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

    Local trap:bool     = Probablity(0.3)
    Local monster:bool  = Probablity(0.3)
    Local treasure:bool = Probablity(0.3)

    if monster  then room.elements.add(PickRandomMonster())
    if trap         then room.elements.add(PickRandomTrap())
    if treasure then room.elements.add(PickRandomTreasure())

    return room
  End
End

Function Probablity:Bool(chance:Float)
    return Random(0, 100) > chance*100
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
  castle.map   = new Room[size, size]
  castle.start = new Location
  castle.start.x = 0
  castle.start.y = 1

  castle.map[0, 0] = room1
  castle.map[0, 1] = room2

  Local player:= EntityGenerator.GeneratePlayer()


  '1. Loop every entity - and check it's visibility against all other entities perception
  '2. So here let us check player against trap and trap against player

'    local perception:int = PerceptionRoll(player)
'    Local actions:= new Stack<string>
'    if perception > trap.visibility
'        actions.Add(TrapIdentifiedActions())
'    End

  '3. Pick action to perform among possible actions
  '4. Perform Action for players and monsters based on their priority
  '5. We now has a list with "events" that just happened
  '6. Filter this list and show events to player of relevance
  '7. At this point player is still in same room OR in an entryway to another room
  '8. If in same room then goto 1. but give +visibility to the things we have already spotted
  '9. 

End


Function PerceptionChecksGenerateActions:Void()

    Local player:= EntityGenerator.GeneratePlayer()
    Local trap:=   EntityGenerator.GenerateTrap()

    Local concequence:= DoAction(player, Attempt.Disarm, trap)






End

enum Attempt
    Disarm = "Disarm",
    Trigger = "Trigger",
    Attack = "Attack",
    Flee = "Flee",
    Move = "Move",
    Open = "Open",
    PickUp = "Pick Up"
end

class Entity
    field type:string = "no type"
    field description:string = "no description"
    field location:Location
    field visibility:int = 10
    field actionlist:= new Stack<string>

    'Trap specific data
    field disarmed:bool = false
    field triggered:bool = false
    field trigger:bool = false
end

Function PerceptionRoll:Bool(actor:Entity)
    return Probablity(1.0)
End
Function DisarmRoll:Bool(actor:Entity, trap:Entity)
    return Probablity(1.0)
End

Function DisarmTarget:Consequence(trap:Entity)
    trap.disarmed = true
    return Consequence.Disarmed
End

enum Consequence
    Disarmed = "Disarmed",
    TrapTriggered = "Trap Triggered",
    Unknown = "Unknown"
end

Function TriggerTrap:Void(trap:Entity)
    If trap.triggered = false
        trap.trigger = true
        return Consequence.TrapTriggered
    End
End

Function DoAction:Consequence(actor:Entity, attempt:Attempt, target:Entity)
    If attempt = Attempt.Disarm
        If DisarmRoll(actor, target)
            return DisarmTarget(target)
        Else
            If TrapTriggeredRoll(actor, target)
                return TriggerTrap(target)
            end
        End
    elseif action =  Attempt.Trigger
    elseif action =  Attempt.Attack

    elseif action =  Attempt.Flee

    elseif action =  Attempt.Move

    elseif action =  Attempt.Open

    elseif action =  Attempt.PickUp

    End
    return Consequence.Unknown
End

Function CheckAvailableActions:Stack<String>(actor:Entity)
    return actor.actionList
End


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
