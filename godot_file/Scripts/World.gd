extends Node2D

var poss = []

func _ready():
	for x in $Dunge_map.map_w:
		for y in $Dunge_map.map_h:
			if $Dunge_map.get_cell(x, y) == 1:
				poss.append(Vector2((x+1)*16, (y+1)*16))
