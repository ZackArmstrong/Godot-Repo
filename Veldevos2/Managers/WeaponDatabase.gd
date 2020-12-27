extends Node

var weapons = Array()

func _ready():
	var directory = Directory.new()
	directory.open("res://Weapons")
	directory.list_dir_begin()
	
	var filename = directory.get_next()
	while(filename): 
		if not directory.current_is_dir():
			weapons.append(load("res://Weapons/%s" %  filename))
		
		filename = directory.get_next()

func get_item(weapon_name):
	for w in weapons:
		if w.name == weapon_name:
			return w
	
	return null
