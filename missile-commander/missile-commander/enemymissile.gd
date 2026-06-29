extends CharacterBody2D
var gameOver = false
var targetpos
var explodeScene = preload("res://explosion.tscn")
func _ready():
	add_to_group("missiles")
	randomize()
	targetpos = get_parent().get_node("city"+str(randi_range(1,5))).position
	look_at(targetpos)

func _physics_process(delta: float) -> void:
	var direction := global_transform.origin.direction_to(targetpos)
	var distance := global_transform.origin.distance_to(targetpos)
	var max_speed := (distance / delta)
	velocity = direction * minf(70, 70)
	look_at(position+velocity)
	rotation_degrees+=90
	if gameOver:
		velocity = Vector2.ZERO
	move_and_slide()

func _on_hitbox_area_entered(area: Area2D) -> void:
	if "explosion" in area.name:
		queue_free()

func _on_hitbox_body_entered(body: Node2D) -> void:
	if "playermissile" in body.name:
		var instance = explodeScene.instantiate()
		get_parent().add_child(instance)
		instance.position = position
		instance.name = "explosion"
		queue_free()
	elif "city" in body.name:
		get_tree().call_group("missiles","cityHit",str(body.name))
		queue_free()

func gameover():
	gameOver = true
