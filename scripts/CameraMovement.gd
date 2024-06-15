extends Camera3D # SHOUTOUT TO CHATGPT4

var move_speed = 5.0
var forward_movement_duration = 5.0
var current_movement_time = 0.0
var is_moving_forward = false
var initial_position = Vector3()  # Variable to store the initial position

var bobbing_amplitude = 0.05  # The maximum displacement on the Y axis
var bobbing_frequency = 10.0  # How fast the bobbing occurs

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Initialization code here, if needed.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_moving_forward:
		# Calculate the forward movement
		var forward = global_transform.basis.z.normalized() * move_speed * delta
		# Move the camera forward
		global_transform.origin -= forward
		# Update the timer
		current_movement_time += delta

		# Apply head bobbing effect
		var bobbing_offset = sin(current_movement_time * bobbing_frequency) * bobbing_amplitude
		global_transform.origin.y = initial_position.y + bobbing_offset

		if current_movement_time >= forward_movement_duration:
			is_moving_forward = false
			#global_transform.origin = initial_position  # Reset to the initial position



func _on_button_pressed() -> void:
	is_moving_forward = true
	current_movement_time = 0.0
	initial_position = global_transform.origin
