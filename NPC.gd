extends KinematicBody2D

onready var player: Player = $"../Player"
var patrols: Array = []
var current_patrol_index = 0
var can_see_player = false
var is_turning_around = false
var target_rotation = 0

func _ready():
  for node in get_children():
    var name: String = node.name
     
    if name.begins_with("Patrol"):
      patrols.append(node.global_position)

func _physics_process(delta):
  var current_target: Vector2
  var speed_modifier = 1
      
  if can_see_player:
    current_target = player.position
  else:
    current_target = patrols[current_patrol_index]
  
    if position.distance_to(current_target) < 10:
      current_patrol_index = (current_patrol_index + 1) % len(patrols)
      current_target = patrols[current_patrol_index]
      is_turning_around = true
      target_rotation = self.rotation_degrees + rad2deg(get_angle_to(current_target)) + 90
      
    if position.distance_to(current_target) < 50:
      speed_modifier = clamp(1/(31-position.distance_to(current_target)), 0.4, 1)
    
  var movement_vec = (current_target - position).normalized() * (200 if can_see_player else 100)
  movement_vec *= speed_modifier
  
  if is_turning_around:
    self.rotation += delta*2
    if self.rotation_degrees >= target_rotation:
      is_turning_around = false
    
  else: 
    move_and_slide(movement_vec)

func _on_Area_body_entered(body):
  if body == player:
    can_see_player = true
    player.is_seen_by_enemy = true

func _on_Area_body_exited(body):
  if body == player:
    can_see_player = false
    player.is_seen_by_enemy = false
