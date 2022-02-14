extends CMD
class_name CMD_Use


var target: Fighter
var card: Card


func _init(battle: Battle, target: Fighter, card: Card):
	super._init(battle)
	self.target = target
	self.card = card 


func start():
	var hand: Deck = target.decks[Fighter.HAND]
	var draw: Deck = target.decks[Fighter.DRAW] 
	
	if hand.has(card):
		hand.erase(card)
	if draw.has(card):
		draw.erase(card)
		
	battle.user[card] = target
	battle.table.append(card)
	
	var skill = card.skill_handler(battle, target)
	await skill.start()
