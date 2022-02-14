extends Resource
class_name Card 


 # 卡牌名称
@export var card_name: String = "no name"


# 卡图  
@export var texture: Texture 


# 卡牌细节描述
@export var info: String = "no info" 


func event_handler(journey: Journey) -> Event:
	return null


func fighter_handler(battle: Battle) -> Fighter:
	return null 


func skill_handler(battle: Battle, user: Fighter) -> Skill:
	return null 
