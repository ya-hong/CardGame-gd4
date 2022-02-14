extends Resource 
class_name Deck 


signal appended(card: Card)
signal erased(card: Card)
signal replaced(old: Card, new: Card)


@export var cards: Array[Resource] 


var n:
	get: return len(cards)



func get_cards() -> Array[Card]:
	return cards.duplicate() 


func has(card: Card):
	return card in cards 


func append(card: Card):
	cards.append(card)
	appended.emit(card)


func erase(card: Card):
	if card in cards:
		cards.erase(card) 
		erased.emit(card)
	else:
		push_error("no card", card)


func replace(old: Card, new: Card):
	var idx = cards.find(old)
	if idx == -1:
		push_error("no card", old)
		return 
	cards[idx] = new 
	replaced.emit(old, new)


func pop() -> Card:
	if len(cards) == 0:
		push_error("no card in deck")
		return null
	var card = cards.back()
	erase(card)
	return card
