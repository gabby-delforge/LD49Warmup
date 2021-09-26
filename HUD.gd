extends CanvasLayer
class_name HUD

onready var stealth_bar_fg = $StealthOMeter/StealthBarFG
var COLOR_SAFE = Color.white
var COLOR_80 = Color.khaki
var COLOR_60 = Color.darkorange
var COLOR_DANGER = Color.red

func _ready():
  pass # Replace with function body.

func set_stealthiness(amount):
  stealth_bar_fg.rect_scale = Vector2(min(amount, 100.0) / 100.0, 1.0)
  if amount > 80:
    stealth_bar_fg.color = COLOR_SAFE
  elif amount > 60:
    stealth_bar_fg.color = COLOR_80
  elif amount >  30:
    stealth_bar_fg.color = COLOR_60
  else:
    stealth_bar_fg.color = COLOR_DANGER
