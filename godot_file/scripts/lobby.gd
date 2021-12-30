extends Node2D



func _ready():
	Global.my_id_net = get_tree().get_network_unique_id()
	get_tree().connect("network_peer_connected", self, "create_player")
	get_tree().connect("network_peer_disconnected", self, "remote_player")
	get_tree().connect("server_disconnected", self, "server_stop")
	var player_server = preload("res://screens/Player.tscn").instance()
	player_server.name = str(Global.my_id_net)
	player_server.global_position = $spawn_players.global_position
	player_server.set_network_master(Global.my_id_net)
	add_child(player_server)
	Global.ids.append(Global.my_id_net)
	if is_network_master():
		$lobby_menu/i_ready.show()


func create_player(id):
	var player = preload("res://screens/player_ower.tscn").instance()
	player.name = str(id)
	player.global_position = $spawn_players.global_position
	add_child(player)
	Global.ids.append(id)

func remote_player(id):
	get_node(str(id)).free()

func server_stop():
	get_tree().change_scene("res://screens/menu.tscn")
	print("Server_stop")
	
func _on_i_ready_pressed():
	get_tree().change_scene("res://screens/world.tscn")
