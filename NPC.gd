extends KinematicBody2D

onready var player: Player = $"../Player"

# Called when the node enters the scene tree for the first time.
func _ready():
  print(player)
  

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#  pass

func _physics_process(delta):
  print(player)
  var movement_vec = player.position - self.position
  
  move_and_slide(movement_vec)
  
