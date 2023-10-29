extends Node2D


var screen_size


func _ready():
	screen_size = get_viewport_rect().size


func _process(_delta):
	pass


func _on_entry_area_2d_body_entered(_body):
	print("body has entered")


func _on_entry_area_2d_body_exited(_body):
	print("body exited")
