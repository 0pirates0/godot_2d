extends RigidBody2D

func _ready():
	pass

func _on_rumarea_body_entered(body):
	if body.is_in_group("player"):
		$".".position = Vector2($"../Player".position.x, $"../Player".position.y+20)
