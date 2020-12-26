extends KinematicBody2D

var motion = Vector2()
const UP = Vector2(0, -1)
const GRAVITY = 20
const SPEED = 200
const JUMPHEIGHT = -400

func _physics_process(delta):
	
	motion.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	
	else: motion.x = 0
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMPHEIGHT
	
	motion = move_and_slide(motion, UP)
	pass
