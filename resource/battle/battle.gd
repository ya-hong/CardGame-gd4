class_name Battle


var fighters: Array[Fighter]
var table: Deck = Deck.new()
var current: Fighter

var owner: Dictionary
var user: Dictionary

var scene: Node


func is_end():
	return fighters[0].hp.value == 0 && fighters[1].hp.value == 0 


func enemy(fighter: Fighter) -> Fighter:
	for f in fighters:
		if f != fighter:
			return f
	push_error('battle fighter enemy error')
	return null


func start(player: Fighter, enemy: Fighter):
	fighters = [player, enemy]
	current = fighters[0]
	
	while not is_end():
		var card = current.choose_to_use()
		if card == null:
			pass
		else:
			pass 
