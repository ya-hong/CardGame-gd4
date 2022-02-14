extends Card 
class_name Character 


# 战斗初始手牌
@export var hands: Resource = Deck.new() as Deck 


# 战斗初始装备
@export var equipments: Resource = Deck.new() as Deck 


func fighter_handler(battle) -> Fighter:
	var fighter = CharacterFighter.new(battle, self)
	return fighter


class CharacterFighter extends  Fighter:
	func _init(battle, character: Character):
		super._init(battle, character) 
		for card in character.hands.get_cards():
			self.decks[self.DRAW].append(card)
		for card in character.equipments.get_cards():
			self.decks[self.EQUIP].append(card)
