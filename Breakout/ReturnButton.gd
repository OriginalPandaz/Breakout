extends Button

export(PackedScene) var start_scene

func returnPressed():
	get_tree().get_root()
	
func returnMouseEntered():
	$"../Select_Sound".play()
	$highlightReturn.visible = true

func returnMouseExited():
	$highlightReturn.visible = false
