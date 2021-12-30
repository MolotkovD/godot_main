extends Node

var RNG = RandomNumberGenerator.new()

func choose(choices):
	if Global.seed_ != null:
		seed(int(Global.seed_))
	else:
		RNG.randomize()
		Global.seed_ = RNG.get_seed()
	var rand_index = RNG.randi() % choices.size()
	return choices[rand_index]
func chance(num):
	if RNG.randi() % 100 <= num:  return true
	else:                     return false
func randi_range(low, high):
	return floor(rand_range(low, high))
func shuffle(array):
	var shuffled = []
	var indexes = range(array.size())
	for i in range(array.size()):
		var x = RNG.randi() % indexes.size()
		shuffled.append(array[indexes[x]])
		indexes.remove(x)
	return shuffled
