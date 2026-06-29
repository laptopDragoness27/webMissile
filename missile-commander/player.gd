extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var bulletScene = preload("res://playermissile.tscn")
var canShoot = true
var gameOver = false

func spawn(scene) -> void:
	var instance = scene.instantiate()
	get_parent().add_child(instance)
	instance.name = "playermissile"

func _ready():
	add_to_group("missiles")

func _process(delta: float) -> void:
	position = get_global_mouse_position()
	if Input.is_action_just_pressed("shoot") and canShoot and not gameOver:
		$shooter.play()
		spawn(bulletScene)
		
		canShoot = false
		$Timer.start()


func gameover():
	gameOver = true

func _on_timer_timeout() -> void:
	canShoot = true
