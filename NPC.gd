extends KinematicBody2D

onready var player: Player = $"../Player"
var patrols: Array = []
var current_patrol_index = 0

func _ready():
  for node in get_children():
    var name: String = node.name
     
    if name.begins_with("Patrol"):
      patrols.append(node.global_position)

func _physics_process(delta):
  var current_patrol = patrols[current_patrol_index]
  
  if position.distance_to(current_patrol) < 10:
    current_patrol_index = (current_patrol_index + 1) % len(patrols)
    current_patrol = patrols[current_patrol_index]
  
  var movement_vec = (current_patrol - position).normalized() * 100
  
  move_and_slide(movement_vec)
