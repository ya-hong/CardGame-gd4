class_name Skill


var battle
var card: Card


# 能否直接使用
var direct: bool = true


# 是否驻场
var persist: bool = false


func _init(battle: Battle, user: Fighter, card: Card):
	self.battle = battle
	self.card = card


func start(cmd = null):
	pass 


func passive_filter(cmd) -> bool:
	return false


func summon_filter(cmd) -> bool:
	return false 


func trigger(cmd):
	return null

