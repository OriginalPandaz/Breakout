extends Button
export(PackedScene) var start_scene
export(PackedScene) var variant_scene
export(PackedScene) var controls_scene
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func defaultPressed():
	get_tree().change_scene_to(start_scene)


func defaultMouseEntered():
	$"../Select_Sound".play()
	$highlightSelect1.visible = true


func defaultMouseExited():
	$highlightSelect1.visible = false


func variantPressed():
	get_tree().change_scene_to(variant_scene)


func variantMouseEntered():
	$"../Select_Sound".play()
	$"../Start 2/highlightSelect2".visible = true


func variantMouseExited():
	$"../Start 2/highlightSelect2".visible = false

func controlsPressed():
	get_tree().change_scene_to(controls_scene)

func controlsMouseEntered():
	$"../Select_Sound".play()
	$"../Controls/highlightControls".visible = true


func controlsMouseExited():
	$"../Controls/highlightControls".visible = false

