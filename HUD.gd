extends CanvasLayer
class_name HUD

onready var stealth_bar_fg = $StealthOMeter/StealthBarFG
onready var mock_arrow: ColorRect = $MockArrow
onready var player: Node2D = $"/root/Node2D/YSort/Player"
onready var dest: Node2D = $"/root/Node2D/YSort/Destination"
onready var raycast = $RayCast2D

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

func animate_to_black():
  $AnimationPlayer.play("CircleTransitionOut")
  yield($AnimationPlayer, "animation_finished")
  
func animate_away_from_black():
  $AnimationPlayer.play_backwards("CircleTransitionOut")
  yield($AnimationPlayer, "animation_finished")
  
