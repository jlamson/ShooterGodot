extends CharacterBody2D

signal laser(pos: Vector2)
signal grenade(pos: Vector2)

const SPEED = 500
const FIRE_SCALE = 1.1

var screen_size

var can_laser: bool = true
var can_grenade: bool = true

func _ready():
	screen_size = get_viewport_rect().size
#	position = Vector2(screen_size.x / 2, screen_size.y / 2)

func _process(_delta):
	handle_move()
	handle_shoot()
	handle_grenade()
	
	
func handle_move():
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * SPEED
	move_and_slide()


func handle_shoot():
	if Input.is_action_pressed("primary") and can_laser:
		var laser_spawn = $LaserStartPositions.get_children().pick_random()
		laser.emit(laser_spawn.global_position)
		
		can_laser = false
		$LaserTimer.start()


func handle_grenade():
	if Input.is_action_pressed("secondary") and can_grenade:
		grenade.emit($GrenadeStartPosition.global_position)
		
		can_grenade = false
		$GrenadeTimer.start()
		


func _on_laser_timer_timeout():
	can_laser = true

func _on_grenade_timer_timeout():
	can_grenade = true

