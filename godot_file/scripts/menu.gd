extends Control
func _on_New_game_b_pressed():
	$gen.visible = true
func _on_Sett_b_pressed():
	$sett.visible = true
func _on_Go_beak_b_pressed():
	$gen.visible = false
func _on_Go_beak_b_pressed_sett():
	$sett.visible = false
func _on_Go_b_pressed():
	get_tree().change_scene("res://screens/world.tscn")



func _on_Host():
	var server = NetworkedMultiplayerENet.new()
	server.create_server(8080, 4)
	get_tree().network_peer = server
	get_tree().change_scene("res://screens/lobby.tscn")



func _on_Join_():
	if $gen/get_ip_line.text.is_valid_ip_address():
		var client = NetworkedMultiplayerENet.new()
		client.create_client($gen/get_ip_line.text, 8080)
		get_tree().network_peer = client
		get_tree().change_scene("res://screens/lobby.tscn")
