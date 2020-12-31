extends Resource

signal inventory_changed

export var _weapons = Array() setget set_weapons, get_weapons
export var _index = 0 setget set_weapons, get_weapons
#onready var _display_sprite = get_node("Weapon Body/Sprite")

# Intenal use functions

func _ready():
	#add_weapon("Test Sword")
	#add_weapon("Test Axe")
	pass

func test_func():
	pass

func set_weapons(new_weapons):
	_weapons = new_weapons
	emit_signal("inventory_changed", self)
	
func get_weapons():
	return _weapons
	
func get_weapon(index):
	return _weapons[index]
	
func add_weapon(weapon_name):
	var weapon = WeaponDatabase.get_weapon(weapon_name)
	if not weapon:
		print("Could not find item.")
		return
	_weapons.append(weapon)
	
func set_index(index):
	_index = index
	
func get_index():
	return _index
	
	

# Public use Funcctions

func next_weapon():
	if _index == _weapons.size() - 1:
		_index = 0
	else:
		_index = _index + 1
		
#	_display_sprite.texture = get_weapon(_index).texture


