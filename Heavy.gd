extends KinematicBody2D

#constants
const BASE_HEALTH = 600
const DEFAULT_SPEED = 3000

#variables
var speedx
var speedy
var directionx
var directiony
var velocity = Vector2()
var sprite
var walking_animations

func _ready():
	set_process(true)
	sprite = get_node("Sprite")
	walking_animations = get_node("Sprite/AnimationPlayer")
	walking_animations.set_animation_process_mode(0)
	pass
	
func return_pos():
	return get_pos()
	
func _process(delta):
	
	directionx = 0
	directiony = -1
	
	# setting head direction
	if (directionx == 1): 
		print ("here")
		walking_animations.play("topmove")
	elif (directionx == -1): walking_animations.play("topmove")
	elif (directiony == -1 && walking_animations.get_current_animation()!= "topmove"): 
		print ("ty god")
		walking_animations.play("topmove")
		print(walking_animations.is_playing())
	elif (directiony == 1): walking_animations.play("topmove (copy)")
		
	velocity = Vector2(DEFAULT_SPEED * directionx, DEFAULT_SPEED * directiony)
	velocity = velocity * delta * delta
	move(velocity)
	pass
	
#func ground_pound(playa):
#	var attack = get_node("shoc/Area2D")
#	var dmg = 0
#	if (attack.overlaps_body(playa)):
#		dmg = attack.return_dmg()
		
#	return dmg
	
