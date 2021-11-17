extends Button

func returnPressed():
	get_tree().change_scene("res://Menu.tscn")
	
func returnMouseEntered():
	$"../Select_Sound".play()
	$highlightReturn.visible = true

func returnMouseExited():
	$highlightReturn.visible = false
