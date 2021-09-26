extends Control

onready var destination: Destination = $"/root/Node2D/YSort/Destination"
onready var player: Player = $"/root/Node2D/YSort/Player"

# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.


func _draw():
  var viewport_rect = get_viewport_rect()
  var viewport_pos = viewport_rect.position
  var viewport_end = viewport_rect.end

  var top_left = viewport_pos
  var top_right = viewport_pos + Vector2(viewport_end.x, 0)
  var bottom_left = viewport_pos + Vector2(0, viewport_end.y)
  var bottom_right = viewport_pos + viewport_end

  var player_pos = player.get_global_position()
  var dest_pos = destination.get_global_position()
  
  draw_line(bottom_right, top_right, Color.red, 50)
  draw_line(top_right, top_left, Color.green, 50)
  draw_line(top_left, bottom_left, Color.blue, 50)
  draw_line(bottom_left, bottom_right, Color.purple, 50)

  # get_viewport_transform() * (get_global_transform() * local_pos)
  
  var player_pos_canvas = get_global_transform_with_canvas().xform(player_pos)
  var dest_pos_canvas = get_global_transform_with_canvas().xform(dest_pos)
  
  print(get_global_transform_with_canvas())
  
  draw_line(player_pos_canvas, dest_pos_canvas, Color.yellow, 50)
  # draw_line(Vector2(), Vector2(viewport_end), Color.yellow, 5)

func _process(delta):
  update()
  
func _physics_process(delta):
  pass

  var viewport_rect = get_viewport_rect()
  var viewport_pos = viewport_rect.position
  var viewport_end = viewport_rect.end

  var top_left = viewport_pos
  var top_right = viewport_pos + Vector2(viewport_end.x, 0)
  var bottom_left = viewport_pos + Vector2(0, viewport_end.y)
  var bottom_right = viewport_pos + viewport_end

  var player_pos = player.position
  var dest_pos = destination.position

  var a = Geometry.segment_intersects_segment_2d (player_pos, dest_pos - player_pos, bottom_right, top_right - bottom_right)
  var b = Geometry.segment_intersects_segment_2d (player_pos, dest_pos - player_pos, top_right, top_left - top_right)
  var c = Geometry.segment_intersects_segment_2d (player_pos, dest_pos - player_pos, top_left, bottom_left - top_left)
  var d = Geometry.segment_intersects_segment_2d (player_pos, dest_pos - player_pos, bottom_left, bottom_right - bottom_left)

  var arrow_pos = a if a else b if b else c if c else d

#  if not arrow_pos:
#    print("oops")
#  else:
#    self.rect_global_position = arrow_pos
  

  
