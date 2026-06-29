extends Node2D

var score = 0
var gameoverscene = preload("res://gameover.tscn")
var citystatus = [true,true,true,true,true]

func _ready() -> void:
	add_to_group("missiles")

func cityHit(cityname):
	citystatus[int(cityname[4])-1] = false
	get_node(cityname).get_child(1).frame = 1
	get_node(cityname).get_child(2).get_child(0).position.y+=50
	if citystatus == [false,false,false,false,false]:
		get_tree().call_group("missiles","gameover")
		$pointtime.stop()
		var instance = gameoverscene.instantiate()
		get_parent().add_child(instance)
		instance.get_node("score").text = str(score)

func scored():
	get_tree().call_group("missiles","newscore",score)
	score+=100
	$exploder.play()
	$score.text = str(score)
	if 3-score/2000>0.5:
		$missileSpawner/Timer.wait_time = 3 - score/2000
	else:
		$missileSpawner/Timer.wait_time = 0.5

func explosion():
	$exploder.play()

func _on_pointtime_timeout() -> void:
	score+=10
	get_tree().call_group("missiles","newscore",score)
	$score.text = str(score)
	if 3-score/2000>0.5:
		$missileSpawner/Timer.wait_time = 3 - score/2000
	else:
		$missileSpawner/Timer.wait_time = 0.5
