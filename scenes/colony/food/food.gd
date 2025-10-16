class_name Food
extends Area2D

## A class that represents food.

@onready var sprite: AnimatedSprite2D = $Sprite


func _ready() -> void:
	set_random_sprite()


func set_random_sprite():
	sprite.frame = randi() % sprite.sprite_frames.get_frame_count(sprite.animation)
	print(sprite.frame)
