extends CharacterBody2D

var screen_size

const SPEED = 500
const FIRE_SCALE = 1.1

func _ready():
	screen_size = get_viewport_rect().size
	position = Vector2(screen_size.x / 2, screen_size.y / 2)

func _process(_delta):
	handle_move()
	handle_shoot()
	
	
func handle_move():
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED
	move_and_slide()


func handle_shoot():
	if Input.is_action_just_pressed("primary"):
		$PlayerImage.scale *= FIRE_SCALE
	if Input.is_action_just_released("primary"):
		$PlayerImage.scale /= FIRE_SCALE
