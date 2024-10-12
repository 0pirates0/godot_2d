extends CharacterBody2D

const SPEED = 300.0
var JUMP_VELOCITY = -400.0
var life = 3
var breath = 10

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var ani = get_node("AnimatedSprite2D")
var js = JUMP_VELOCITY*(0.3)
var grav = gravity*(0.3)
var wspeed = SPEED*(0.3)
var isinwater = 0

func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	# Add the gravity.
	#if not is_on_floor():
	#	velocity.y += gravity * delta

	# Handle jump.
	if isinwater==0:
		
		if not is_on_floor():
			velocity.y += gravity * delta

		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		
		if direction:
			velocity.x = direction * SPEED
			ani.play("run")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			ani.play("Idle")
		
		while breath <= 10:
			await get_tree().create_timer(1).timeout
			breath += 10

	else:
		#if breath > 0:
			#await get_tree().create_timer(1).timeout
			#breath -= 1
		#else:
			#get_tree().change_scene_to_file("res://lvl6/lvl6.tscn")

		if not is_on_floor():
			velocity.y += (0.3)*gravity * delta
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = js
		
		if direction:
			velocity.x = direction * wspeed
			ani.play("swim")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			ani.play("widle")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	

	move_and_slide()


func _on_area_2d_area_entered(area):
	get_tree().change_scene_to_file("res://lvl1/lvl1.tscn")


func _on_trigger_area_entered(area):
	pass


func _on_thorn_area_entered(area):
	if area.is_in_group("player"):
		ani.play("ded")
		if life<=0:
			get_tree().change_scene_to_file("res://game-over.tscn")
		else:
			print(life)
			get_tree().change_scene_to_file("res://lvl1/lvl1.tscn")
			life = life - 1


func _on_thorn_2_area_entered(area):
	if area.is_in_group("player"):
		ani.play("ded")
		if life<=0:
			get_tree().change_scene_to_file("res://game-over.tscn")
		else:
			print(life)
			get_tree().change_scene_to_file("res://lvl1/lvl1.tscn")
			life = life - 1


func _on_tunlvl_1_area_entered(area):
	get_tree().change_scene_to_file("res://lvl2/lvl2.tscn")


func _on_mobarea_area_entered(area):
	if area.is_in_group("player"):
		ani.play("ded")
		if life<=0:
			get_tree().change_scene_to_file("res://game-over.tscn")
		else:
			print(life)
			get_tree().change_scene_to_file("res://lvl2/lvl2.tscn")
			life = life - 1


func _on_mobded_area_entered(area):
	if area.is_in_group("player"):
		$"../Node2D".queue_free()


func _on_mtarea_area_entered(area):
	if area.is_in_group("player"):
		ani.play("ded")
		if life<=0:
			get_tree().change_scene_to_file("res://game-over.tscn")
		else:
			print(life)
			get_tree().change_scene_to_file("res://lvl2/lvl2.tscn")
			life = life - 1


func _on_nxtlvl_area_entered(area):
	if area.is_in_group("player"):
		get_tree().change_scene_to_file("res://lvl3/lvl3.tscn")


func _on_thorns_area_entered(area):
	if area.is_in_group("player"):
		ani.play("ded")
		if life<=0:
			get_tree().change_scene_to_file("res://game-over.tscn")
		else:
			print(life)
			get_tree().change_scene_to_file("res://lvl3/lvl3.tscn")
			life = life - 1


func _on_area_2d_2_body_entered(body):
	if body.is_in_group("box"):
		body.collision_mask = 1
		body.collision_layer = 1


func _on_area_2d_2_body_exited(body):
	if body.is_in_group("box"):
		body.collision_mask = 2
		body.collision_layer = 2


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		ani.play("ded")
		if life<=0:
			get_tree().change_scene_to_file("res://game-over.tscn")
		else:
			print(life)
			get_tree().change_scene_to_file("res://lvl4/lvl4.tscn")
			life = life - 1


func _on_tded_body_entered(body):
	if body.is_in_group("player"):
		ani.play("ded")
		if life<=0:
			get_tree().change_scene_to_file("res://game-over.tscn")
		else:
			print(life)
			get_tree().change_scene_to_file("res://lvl4/lvl4.tscn")
			life = life - 1


func _on_nextlvl_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://lvl4/lvl4.tscn")


func _on_sawt_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://lvl5/lvl5.tscn")


func _on_thorn_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://lvl5/lvl5.tscn")


func _on_waterarea_body_entered(body):
	if body.is_in_group("player"):
		isinwater = 1
		#while breath > 0:
			#breath -= 1
			#await get_tree().create_timer(1).timeout
			#if breath <= 0:
				#get_tree().change_scene_to_file("res://lvl6/lvl6.tscn")


func _on_waterarea_body_exited(body):
	if body.is_in_group("player"):
		isinwater=0
