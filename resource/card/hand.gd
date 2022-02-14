extends Card 


var pSkill = Skill


func skill_handler(battle: Battle, user: Fighter) -> Skill:
	var skill = pSkill.new(battle, user, self)
	return skill
