extends Node2D

var test_array: Array[String] = ["Test", "Hello", "World"]

var direction = 1
const ROT_SPEED = 45
const ROT_MAX = 90
const ROT_MIN = -90

func _ready():
	$Logo.rotation_degrees = 0
	
	for val in test_array:
		print(val)


func _process(delta):
	$Logo.rotation_degrees += (ROT_SPEED * delta * direction)
	
	if $Logo.rotation_degrees >= ROT_MAX:
		direction = -1
	if $Logo.rotation_degrees <= ROT_MIN:
		direction = 1
	
	if $Logo.position.x > 1000:
		$Logo.pos.x = 0
