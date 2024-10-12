extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_trigger_area_entered(area):
	$AnimationPlayer.play("disappear")
	await get_tree().create_timer(1).timeout
	queue_free()
