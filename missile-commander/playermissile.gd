extends CharacterBody2D

var explodeScene = preload("res://explosion.tscn")
var targetpos
func _ready():
	position = Vector2(320,360)
	targetpos = get_parent().get_node("player").position
	look_at(targetpos)
	add_to_group("missiles")
	rotation_degrees+=90

func _physics_process(delta: float) -> void:
	var direction := global_transform.origin.direction_to(targetpos)
	var distance := global_transform.origin.distance_to(targetpos)
	var max_speed := (distance / delta)
	velocity = direction * minf(300, 300)
	move_and_slide()
	if distance<5:
		var instance = explodeScene.instantiate()
		get_parent().add_child(instance)
		instance.position = position
		instance.name = "explosion"
		get_tree().call_group("missiles","explosion")
		queue_free()
		#explode
