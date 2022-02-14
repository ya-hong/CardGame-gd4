extends Resource
class_name Map 

signal placed(card: Card, position: Vector2i)
signal erased(card: Card)
signal moved(card: Card, position: Vector2i)


@export var card2position: Dictionary
@export var position2card: Dictionary
@export var position_marked: Array 


func erase(card: Card) -> void:
	if not card in card2position:
		push_error("no this card")
		return 
	
	var position = card2position[card]
	card2position.erase(card)
	position2card.erase(position)
	
	erased.emit(card)


func place(card: Card, position: Vector2i) -> void:
	if position2card.get(position):
		erase(card) 
	else:
		position_marked.append(position)
	
	card2position[card] = position
	position2card[position] = card 


func move(card: Card, position: Vector2i) -> void:
	if not card2position.get(card):
		push_error('no this card')
		return
	if position2card.get(position):
		push_error('this position have card')
		return
	position2card.erase(card2position[card])
	card2position[card] = position
	position2card[position] = card 


func card_at(position: Vector2i) -> Card:
	return position2card.get(position)


func position_of(card: Card) -> Vector2i:
	return card2position.get(card)


func viewed(position: Vector2i) -> bool:
	return position in position_marked
