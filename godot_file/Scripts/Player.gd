extends KinematicBody2D

export var SPEED = 200
var velocity

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	rpc_unreliable("update_poss", global_position)

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	velocity = velocity.normalized() * SPEED
