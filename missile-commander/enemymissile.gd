extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var targetpos
func _ready():
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
	move_and_slide()
	if distance<40:
		queue_free()
		#explode

func _on_hitbox_area_entered(area: Area2D) -> void:
	if "explosion" in area.name:
		queue_free()

func _on_hitbox_body_entered(body: Node2D) -> void:
	if "playermissile" in body.name:
		queue_free()
