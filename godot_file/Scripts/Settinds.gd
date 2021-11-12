extends Control

func _on_BackB_button_down():
	visible = false


func _on_HSlider_value_changed(value):
	$"../bg_music".volume_db = value
	$"/root/Global".vol_music = value
