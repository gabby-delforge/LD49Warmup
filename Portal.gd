extends Node2D

export var next_portal_path: NodePath
onready var player: KinematicBody2D = $"/root/Node2D/YSort/Player"
onready var next_portal: Node2D = get_node(next_portal_path)

func _on_Area2D_body_entered(body):
  if body == player:
    player.position = player.last_movement.normalized() * 100 + next_portal.position
