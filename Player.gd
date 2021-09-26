extends KinematicBody2D
class_name Player
signal _player_hit

var last_movement: Vector2 = Vector2(1, 0)
onready var sprite = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  pass
  
func _physics_process(delta):
  var movement_vec: Vector2 = Vector2()
  movement_vec.x += -1 if Input.is_action_pressed("move_left") else 0
  movement_vec.x += 1 if Input.is_action_pressed("move_right") else 0
  movement_vec.y += -1 if Input.is_action_pressed("move_up") else 0
  movement_vec.y += 1 if Input.is_action_pressed("move_down") else 0
  
  movement_vec = movement_vec.normalized()
  movement_vec *= 500
  
  if movement_vec.length() != 0:
    last_movement = movement_vec
  
  move_and_slide(movement_vec)
  
func _on_Area2D_body_entered(body):

  emit_signal("_player_hit")
