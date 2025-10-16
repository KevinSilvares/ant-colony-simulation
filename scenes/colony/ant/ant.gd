class_name Ant
extends CharacterBody2D

## This class represents an Ant.

@export var SPEED = 10

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D

var current_objective

func _ready() -> void:
	current_objective = get_tree().get_first_node_in_group("food")
	print(current_objective, current_objective.global_position)

func _process(_delta: float) -> void:
	navigation_agent_2d.target_position = current_objective.global_position


func _physics_process(delta: float) -> void:
	var next_position = navigation_agent_2d.get_next_path_position()
	
	var direction = global_position.direction_to(next_position)
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * delta)
		velocity.y = move_toward(velocity.y, 0, SPEED * delta)
		
	move_and_slide()
