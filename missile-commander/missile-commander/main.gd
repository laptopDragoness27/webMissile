extends Node2D

var citystatus = [true,true,true,true,true]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("missiles")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func cityHit(cityname):
	print(cityname)
	citystatus[int(cityname[4])-1] = false
	if citystatus == [false,false,false,false,false]:
		get_tree().call_group("missiles","gameover")
		print("game over")
