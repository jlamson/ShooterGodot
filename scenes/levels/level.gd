extends Node2D


var screen_size

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _ready():
	screen_size = get_viewport_rect().size


func _process(_delta):
	pass


func _on_gate_player_entered(body):
	print("level - on_gate_player_entered")
	print(body)


func _on_gate_player_exited(body):
	print("level - on_gate_player_exited")
	print(body)


func _on_player_laser(pos: Vector2):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	$Projectiles.add_child(laser)


func _on_player_grenade(pos: Vector2):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = Vector2.UP * 100
	$Projectiles.add_child(grenade)
