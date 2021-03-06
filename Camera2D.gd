extends Camera2D

onready var player: Node2D = $"/root/Node2D/YSort/Player"
var noise = OpenSimplexNoise.new()

func _ready():
  # Configure
  noise.seed = randi()
  noise.octaves = 4
  noise.period = 20.0
  noise.persistence = 0.8

func _process(delta):
  position = player.position

func _on_Player__player_hit():
  var random_vec = noise.get_noise_2d(1.0, 1.0)
  position += 10*Vector2(random_vec, random_vec)
  
