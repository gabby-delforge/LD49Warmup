extends Node2D
class_name Arrow

onready var destination: Destination = $"/root/Node2D/YSort/Destination"
onready var player: Player = $"/root/Node2D/YSort/Player"
onready var hud: HUD = $"/root/Node2D/HUD"
onready var viewport = get_tree().root

# Change this value to increase or decrease how much space is between the arrow
# and the edge of the screen.
var margin = 30


# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.

func get_arrow_global_pos():
  var arrow_pos
  var player_pos = player.global_position
  var dest_pos = destination.global_position
  
  var viewport = get_viewport().get_visible_rect()
  var viewport_size = viewport.size
  

  var edge_margin = viewport_size*margin/1000
    
  var top_left = player.global_position - viewport_size/2
  var bottom_right = top_left + viewport_size
  var top_right = top_left + Vector2(viewport_size.x,0)
  var bottom_left = top_left + Vector2(0,viewport_size.y)

  var world_viewport = Rect2(top_left, viewport_size)
  
  # Check if destination is in the viewport
  if world_viewport.has_point(dest_pos):
    var dist_from_player = player_pos.distance_to(dest_pos)
    if (dist_from_player < edge_margin.length()):
      arrow_pos = dest_pos - dist_from_player*(dest_pos - player_pos).normalized()
    else:
      arrow_pos = dest_pos - edge_margin.length()*(dest_pos - player_pos).normalized()
    return arrow_pos
    
  # If it's not in the viewport, find and return the intersection of the viewport
  # bounds and the line between the player and destination
  var a = Geometry.segment_intersects_segment_2d(player_pos, dest_pos, bottom_right, top_right)
  var b = Geometry.segment_intersects_segment_2d(player_pos, dest_pos, top_right, top_left)
  var c = Geometry.segment_intersects_segment_2d(player_pos, dest_pos, top_left, bottom_left)
  var d = Geometry.segment_intersects_segment_2d(player_pos, dest_pos, bottom_left, bottom_right)

  arrow_pos = a if a else b if b else c if c else d if d else null
  
  if not arrow_pos:
    return
  else:
    return arrow_pos - edge_margin.length()*(dest_pos - player_pos).normalized()

  
