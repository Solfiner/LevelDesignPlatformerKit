extends Area3D

var time := 0.0
var grabbed := false

# Collecting coins

func _on_body_entered(body):
	if body.has_method("collect_coin") and !grabbed:
		
		body.collect_coin()
		
		Audio.play("res://sounds/household_door_keys_hang_on_hook_003.mp3") # Play sound
		
		$Mesh.queue_free() # Make invisible
		$Particles.emitting = false # Stop emitting stars
		
		grabbed = true

# Rotating, animating up and down

func _process(delta):
	
	rotate_y(2 * delta) # Rotation
	position.y += (cos(time * 5) * 1) * delta # Sine movement
	
	time += delta
