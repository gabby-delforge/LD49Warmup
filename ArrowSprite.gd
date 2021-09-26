extends Sprite

onready var arrow: Arrow = $"/root/Node2D/Arrow" 
onready var destination: Destination = $"/root/Node2D/YSort/Destination"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
  print(arrow)
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  var pos = arrow.get_arrow_global_pos()
  if pos:
    self.position = pos
    
  look_at(destination.global_position)
  self.rotation_degrees += 90
  
  

  
  
  
