extends Button
export(PackedScene) var start_scene
export(PackedScene) var variant_scene
export(PackedScene) var controls_scene

func defaultPressed():
	get_tree().change_scene_to(start_scene)


func defaultMouseEntered():
	$"../Select_Sound".play()
	$highlightBreakout.visible = true


func defaultMouseExited():
	$highlightBreakout.visible = false


func variantPressed():
	get_tree().change_scene_to(variant_scene)


func variantMouseEntered():
	$"../Select_Sound".play()
	$"../Start 2/highlightVariant".visible = true


func variantMouseExited():
	$"../Start 2/highlightVariant".visible = false

func controlsPressed():
	get_tree().change_scene_to(controls_scene)

func controlsMouseEntered():
	$"../Select_Sound".play()
	$"../Controls/highlightControls".visible = true


func controlsMouseExited():
	$"../Controls/highlightControls".visible = false

