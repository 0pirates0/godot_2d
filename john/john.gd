extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("nottrigg")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_trigger_area_entered(area):
	if area.is_in_group("player"):
		$AnimationPlayer2.play("trigg")
