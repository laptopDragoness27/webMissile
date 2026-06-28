extends Node2D

var missilescene = preload("res://enemymissile.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()

func _on_timer_timeout() -> void:
	position.x = randi_range(0,640)
	var instance = missilescene.instantiate()
	get_parent().add_child(instance)
	instance.position=global_position
