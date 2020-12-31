extends GridContainer

func _ready():
	GameManager.connect("player_initialised", self, "_on_player_inventory_changed")
	
func _on_player_inventory_changed(inventory):
	for n in get_children():
		n.queue_free()
		
	for weapon in inventory.get_weapons():
		var weapon_label = Label.new()
		weapon_label.text = "%s" % [weapon.weapon_reference.name]
		add_child(weapon_label)
