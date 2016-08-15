Namespace ludodungeon
#Import "<std>"
Using std..

Function Main()

End

Function CreateTestCastle:Room[]()

End

Class Room
End

Function CreateCastle:Room[]()

End

'Room with trap
Function Room_element_with_highest_visibility_should_be_identified_first:void()
	Local element1:= CreateRoomElement(4)
	Local element2:= CreateRoomElement(5)
End

Function CreateRoomElement:RoomElement(visibility:int)
	Local element:= new RoomElement
	element.Visibility = 5
	return element
End

Function Roll_Average:int(maximum:int=10, weight:int=0)
	return Clamp(Int(Round(maximum*0.5)+weight),0, maximum)
End

Function Roll_Worst:int(maximum:int=10, weight:int=0)
	return Clamp(weight, 0, maximum)
End

Function Roll_Best:int(maximum:int=10, weight:int=0)
	return maximum
End

' Bell curve dice
Function Roll:int(maximum:int=10, weight:int=0)
	Local half:double = maximum/2.0
	Local roll1:int = Round(Rnd(half))
	Local roll2:int = Round(Rnd(half))
	Local result:= roll1 + roll2
	result += weight
	Clamp(result, 0, maximum)
	return result
End

Function PerceptionCheck:bool(perception:float, visibility:float)
	If perception > visibility Then return true else return false
End

Class RoomElement
	Field Visibility:int
End
