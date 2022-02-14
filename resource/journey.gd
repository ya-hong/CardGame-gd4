extends Resource
class_name Journey


const DIRECTS = [
	Vector2i(0, -1), 
	Vector2i(1, 0), 
	Vector2i(0, 1), 
	Vector2i(-1, 0), 
]


# 牌堆
@export var card_pile: Resource = Deck.new() as Deck


# 地图
@export var card_map: Resource = Map.new() as Map 


# 玩家
@export var player: Resource = Player.new() as Player


# UI
var scene: Node



func start(player: Player):
	self.player = player
	card_map.place(player, Vector2i(0, 0))
	get_view()


func get_view():
	for direct in DIRECTS:
		var position = card_map.position_of(player) + direct
		if not card_map.viewed(position):
			var card = card_pile.pop()
			card_map.place(card, position)


func move(position):
	var d = position - card_map.position_of(player) 
	if not d in DIRECTS:
		return 
	
	var card: Card = card_map.card_at(position)
	if card == null:
		card_map.move(player, position)
		get_view()
	else:
		card.event_handler(self).event_start()

