extends Character
class_name Enemy 


class EnemyEvent extends Event:
	var BattleScene: PackedScene
	func event_start():
		var scene: Node = BattleScene.instance()
		journey.scene.visible = false 
		journey.scene.get_tree().add_child(scene)
		await scene.tree_exited


func event_handler(journey) -> Event:
	var event = EnemyEvent.new(journey, self)
	return event 
