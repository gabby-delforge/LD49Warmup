extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var noise = OpenSimplexNoise.new()

# Called when the node enters the scene tree for the first time.
func _ready():
  
  # Configure
  noise.seed = randi()
  noise.octaves = 4
  noise.period = 20.0
  noise.persistence = 0.8


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#  pass


func _on_Player__player_hit():
  var random_vec = noise.get_noise_2d(1.0, 1.0)
  position += 10*Vector2(random_vec, random_vec)
  
