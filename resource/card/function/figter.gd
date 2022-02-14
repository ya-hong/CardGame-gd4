class_name Fighter


enum {
	DRAW, HAND, EQUIP, DISCARD
}

var battle
var card: Card


@export var decks: Array[Resource] = [
	Deck.new(), 
	Deck.new(), 
	Deck.new(), 
	Deck.new(), 
]


func _init(battle, card: Card):
	self.battle = battle
	self.card = card
