extends CanvasLayer
class_name HUD

onready var stealth_bar_fg = $StealthOMeter/StealthBarFG

func _ready():
  pass # Replace with function body.

func set_stealthiness(amount):
  stealth_bar_fg.rect_scale = Vector2(min(amount, 100.0) / 100.0, 1.0)
