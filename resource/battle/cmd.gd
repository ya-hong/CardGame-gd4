class_name CMD 


enum {
	BEGIN, 
	AFTER, 
	CANCEL
}


var state = BEGIN

var battle: Battle


func _init(battle: Battle):
	self.battle = battle


func start():
	pass 


func execute():
	await trigger()
	
	if state == BEGIN:
		await start()
		state = AFTER

	await trigger()
	

func trigger():
	# 触发桌面牌
	for card in battle.table.get_cards():
		if not battle.table.has(card) || not battle.user[card]:
			continue
		var skill: Skill = card.skill_handler(battle, battle.user[card])
		var method = skill.trigger(self)
		if method:
			await method.call(self)
	
	var fighters = [battle.current, battle.enemy(battle.current)]

	# 触发装备效果
	for fighter in fighters:
		var deck = fighter.decks[Fighter.EQUIP]
		var cards = deck.get_cards()
		for card in cards:
			if not deck.has(card):
				continue 
			var skill: Skill = card.skill_handler(battle, fighter)
			var method = skill.trigger(self)
			if method:
				await method.call(self)
	
	# 触发手牌的被动/召唤效果
	for fighter in fighters:
		var deck = fighter.decks[Fighter.HAND]
		var cards = deck.get_cards()
		for card in cards:
			if not deck.has(card):
				continue 
			var skill: Skill = card.skill_handler(battle, fighter)
			if skill.passive_filter(self) || skill.summon_filter(self):
				await CMD_Use.new(battle, fighter, card).execute()
	
	# 触发召唤效果
	for fighter in fighters:
		var deck = fighter.decks[Fighter.DRAW]
		var cards = deck.get_cards()
		for card in cards:
			if not deck.has(card):
				continue 
			var skill: Skill = card.skill_handler(battle, fighter)
			if skill.summon_filter(self):
				await CMD_Use.new(battle, fighter, card).execute()

