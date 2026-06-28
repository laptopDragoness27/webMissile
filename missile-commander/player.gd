extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var bulletScene = preload("res://playermissile.tscn")
var canShoot = true

func spawn(scene) -> void:
	var instance = scene.instantiate()
	get_parent().add_child(instance)

func _physics_process(delta: float) -> void:
	position = get_global_mouse_position()
	if Input.is_action_just_pressed("shoot") and canShoot:
		spawn(bulletScene)
		canShoot = false
		$Timer.start()


func _on_timer_timeout() -> void:
	canShoot = true
