extends Node2D


func _process(delta):
	input_get()
	
	
func input_get():
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://Screnes/Control.tscn")
