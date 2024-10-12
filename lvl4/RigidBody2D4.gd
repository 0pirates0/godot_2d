extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	gravity_scale = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		gravity_scale = 0.5
