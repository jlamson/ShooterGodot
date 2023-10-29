extends Sprite2D

var pos: Vector2 = Vector2.ZERO
const speed: int = 200

var test_scale: float = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pos = Vector2(300, 200)

	test_scale = 2
	scale.x = test_scale
	scale.y = test_scale


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pos.x += speed * delta
	position = pos
