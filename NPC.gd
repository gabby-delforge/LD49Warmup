extends KinematicBody2D

onready var player: Player = $"../Player"
var patrols: Array = []
var current_patrol_index = 0
var can_see_player = false

func _ready():
  for node in get_children():
    var name: String = node.name
     
    if name.begins_with("Patrol"):
      patrols.append(node.global_position)

func _physics_process(delta):
  var current_target: Vector2
  
  if can_see_player:
    current_target = player.position
  else:
    current_target = patrols[current_patrol_index]
    
    if position.distance_to(current_target) < 10:
      current_patrol_index = (current_patrol_index + 1) % len(patrols)
      current_target = patrols[current_patrol_index]
    
  var movement_vec = (current_target - position).normalized() * (200 if can_see_player else 100)
  
  move_and_slide(movement_vec)

func _on_Area_body_entered(body):
  if body == player:
    can_see_player = true

func _on_Area_body_exited(body):
  if body == player:
    can_see_player = false
