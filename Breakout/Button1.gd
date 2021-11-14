extends Button
export(PackedScene) var start_scene
export(PackedScene) var variant_scene
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func DefaultPressed():
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
	$"../Button2/highlightSelect2".visible = true


func variantMouseExited():
	$"../Button2/highlightSelect2".visible = false
