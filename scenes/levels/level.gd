extends Node2D


var screen_size


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


func _on_player_player_laser_fired():
	print("level - pew pew")


func _on_player_player_grenade_thrown():
	print("level - BOOM")



