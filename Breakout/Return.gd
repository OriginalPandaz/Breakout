extends Button

export(PackedScene) var menu_scene

func returnPressed():
	get_tree().change_scene_to(menu_scene)
	
func returnMouseEntered():
	$"../Select_Sound".play()
	$highlightReturn.visible = true

func returnMouseExited():
	$highlightReturn.visible = false
