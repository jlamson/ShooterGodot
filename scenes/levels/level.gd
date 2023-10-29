extends Node2D


var screen_size

var velocity = Vector2.ZERO
const SPEED = 200

var rotation_direction = 1
const ROT_SPEED = 45
const ROT_MAX = 90
const ROT_MIN = -90


func _ready():
	screen_size = get_viewport_rect().size
	
	$Logo.rotation_degrees = 0
	$Logo.position = Vector2(screen_size.x / 2, screen_size.y / 2)


func _process(delta):
	rotate_logo(delta)
	move_logo(delta)
	scale_logo()


func rotate_logo(delta):
	$Logo.rotation_degrees += (ROT_SPEED * delta * rotation_direction)
	
	if $Logo.rotation_degrees >= ROT_MAX:
		rotation_direction = -1
	if $Logo.rotation_degrees <= ROT_MIN:
		rotation_direction = 1


func move_logo(delta):
	var isLeft = Input.is_action_pressed("left")
	var isRight = Input.is_action_pressed("right")
	var isUp = Input.is_action_pressed("up")
	var isDown = Input.is_action_pressed("down")
	
	if isLeft: 
		velocity.x = -1
	elif isRight:
		velocity.x = 1
	else:
		velocity.x = 0

	if isUp: 
		velocity.y = -1
	elif isDown:
		velocity.y = 1
	else:
		velocity.y = 0
	
	if velocity.length() != 0:
		$Logo.position = $Logo.position + (SPEED * delta * velocity)


func scale_logo():
	if Input.is_action_just_pressed("primary"):
		$Logo.scale = $Logo.scale * 2
	if Input.is_action_just_released("primary"):
		$Logo.scale = $Logo.scale * 0.5
