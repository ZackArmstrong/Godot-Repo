extends Resource
class_name WeaponResource

export var name : String

# Placeholder properties
enum WeaponType {SHORTSWORD, LONGSWORD, BOW, AXE, SPEAR}
export(WeaponType) var type
export var damage : int
export var texture : Texture
