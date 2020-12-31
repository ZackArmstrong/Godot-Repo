extends KinematicBody2D

var motion = Vector2()
var leftOrRight = 1
<<<<<<< HEAD
var inventory_resource = load("res://Player/Inventory.gd")
var inventory = inventory_resource.new()
=======
var isAttacking = false


>>>>>>> e031ba389d5b17b3ff9f1ce020d6e81191b83fa7

const UP = Vector2(0, -1)
const GRAVITY = 20
const MAX_SPEED = 400
const JUMPHEIGHT = -650
const ACCELERATION = 100

onready var animationPlayer = $AnimationPlayer


func _physics_process(delta):
<<<<<<< HEAD
	
	if Input.is_action_just_pressed("ui_focus_next"):
		inventory.next_weapon()
			
	#	$"Test Sword Body/Sprite".visible = true
	
	
=======
>>>>>>> e031ba389d5b17b3ff9f1ce020d6e81191b83fa7
	motion.y += GRAVITY
	var friction = false
	if Input.is_action_pressed("ui_right") && isAttacking == false:
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		$AnimationPlayer.play("RunRight")
		leftOrRight = 1
	elif Input.is_action_pressed("ui_left") && isAttacking == false:
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		$AnimationPlayer.play("RunLeft")
		leftOrRight = 0
	
	else: 
		friction = true
		motion.x = lerp(motion.x, 0, 0.2)
		if leftOrRight == 1 && isAttacking == false:
			$AnimationPlayer.play("IdleRight")
		elif isAttacking == false: 
			$AnimationPlayer.play("IdleLeft")
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMPHEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
	
	if Input.is_action_just_pressed("attack"):
		if leftOrRight == 1:
			$AnimationPlayer.play("AttackRight")
			isAttacking = true
		elif leftOrRight == 0:
			$AnimationPlayer.play("AttackLeft")
			isAttacking = true
	
	motion = move_and_slide(motion, UP)
	






func _on_AnimationPlayer_animation_finished(AttackRight):
	#print(AttackRight)
	#if $AnimationPlayer.is_playing() == "AttackRight":
	#	print("test")
	isAttacking = false
	#if $AnimationPlayer.current_animation == "AttackLeft":
	#	isAttacking = false
