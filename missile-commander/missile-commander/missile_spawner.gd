extends Node2D

var missilescene = preload("res://enemymissile.tscn")
var gameOver = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	add_to_group("missiles")

func _on_timer_timeout() -> void:
	if not gameOver:
		position.x = randi_range(0,640)
		var instance = missilescene.instantiate()
		get_parent().add_child(instance)
		instance.position=global_position

func gameover():
	gameOver = true
