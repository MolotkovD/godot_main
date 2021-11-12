extends Control

var i = load("res://Screnes/settinds.tscn")


func _ready():
	print("App GO!")
	$Setting.visible = false
	$bg_music.volume_db = $"/root/Global".vol_music
	$Setting/HSlider.value = $"/root/Global".vol_music
	

func _on_Go_Game_button_down():
	print("Переход на сцену генерации")
	get_tree().change_scene("res://Screnes/World.tscn")


func _on_SettingB_button_down():
	$Setting.visible = true
