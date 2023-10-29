extends Node2D

var screen_size

const SPEED = 500
const FIRE_SCALE = 1.1

func _ready():
	screen_size = get_viewport_rect().size
	position = Vector2(screen_size.x / 2, screen_size.y / 2)

func _process(delta):
	handle_move(delta)
	handle_shoot(delta)
	
	
func handle_move(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	position += direction * 200 * delta


func handle_shoot(delta):
	if Input.is_action_just_pressed("primary"):
		scale *= FIRE_SCALE
	if Input.is_action_just_released("primary"):
		scale /= FIRE_SCALE
