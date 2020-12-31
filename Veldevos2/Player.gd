extends KinematicBody2D

var motion = Vector2()
var leftOrRight = 1
<<<<<<< HEAD
<<<<<<< HEAD
var inventory_resource = load("res://Player/Inventory.gd")
var inventory = inventory_resource.new()
=======
var isAttacking = false


>>>>>>> e031ba389d5b17b3ff9f1ce020d6e81191b83fa7
=======
var state = MOVE

enum{
	MOVE,
	ATTACK,
	ROLL
}
>>>>>>> parent of e031ba3... Removed State Machine - Temp Attack

const UP = Vector2(0, -1)
const GRAVITY = 20
const MAX_SPEED = 400
const JUMPHEIGHT = -650
const ACCELERATION = 100

onready var animationPlayer = $AnimationPlayer

func _physics_process(delta):
<<<<<<< HEAD
<<<<<<< HEAD
	
	if Input.is_action_just_pressed("ui_focus_next"):
		inventory.next_weapon()
			
	#	$"Test Sword Body/Sprite".visible = true
	
	
=======
>>>>>>> e031ba389d5b17b3ff9f1ce020d6e81191b83fa7
=======
	print(state)
	match state:
		MOVE:
			move_state()
		ATTACK:
			attack_state(delta)
		ROLL:
			pass


func move_state():
	
>>>>>>> parent of e031ba3... Removed State Machine - Temp Attack
	motion.y += GRAVITY
	var friction = false
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		$AnimationPlayer.play("RunRight")
		leftOrRight = 1
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		$AnimationPlayer.play("RunLeft")
		leftOrRight = 0
	
	else: 
		friction = true
		motion.x = lerp(motion.x, 0, 0.2)
		if leftOrRight == 1:
			$AnimationPlayer.play("IdleRight")
		else: 
			$AnimationPlayer.play("IdleLeft")
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMPHEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
	
	motion = move_and_slide(motion, UP)
	
	if Input.is_action_just_pressed("attack"):
		state = ATTACK

func attack_state(delta):
	pass
