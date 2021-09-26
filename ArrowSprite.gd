extends Node2D

onready var arrow: Arrow = $"/root/Node2D/Arrow" 
onready var destination: Destination = $"/root/Node2D/YSort/Destination"
onready var player: Player = $"/root/Node2D/YSort/Player"
onready var text = $"Label"
onready var sprite = $"Sprite"
var text_start_pos = Vector2(-1750, -150)
# Called when the node enters the scene tree for the first time.
func _ready():
  print(arrow)
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  var pos = arrow.get_arrow_global_pos()
  if pos:
    self.position = pos
    
  sprite.look_at(destination.global_position)
  sprite.rotation_degrees += 90
  
  # Convert from world units to meters using a constant that seems to be realistic
  var distance_meters = player.global_position.distance_to(destination.global_position)/130
  var distance_string = ""
  if distance_meters > 500:
    distance_string = "%.1f" % (distance_meters/1000) + " km"
  else:
    distance_string = "%.0f" % (distance_meters) + " m"
  text.text = distance_string
  
  # If the Arrow text location breaks its probably this line im sorry its very brittle hehe
  # This just makes it so that the text always appears near the convex part of the Arrow, even when it's upside down
  var text_offset = 600*Vector2(cos(sprite.rotation + deg2rad(90)), -sin(sprite.rotation - deg2rad(90)))
  text.rect_position = text_start_pos + text_offset

  
  
  
  

  
  
  
