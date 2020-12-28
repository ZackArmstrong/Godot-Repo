extends Resource
class_name Iventory

signal inventory_changed

export var _weapons = Array() setget set_weapons, get_weapons

func set_weapons(new_weapons):
	_weapons = new_weapons
	emit_signal("inventory_changed", self)
	
func get_weapons():
	return _weapons
	
func get_weapon(index):
	return _weapons[index]
	
func add_weapons(weapon_name):
	var weapon = WeaponDatabase.get_weapon(weapon_name)
	if not weapon:
		print("Could not find item.")
		return
	_weapons.append(weapon)
