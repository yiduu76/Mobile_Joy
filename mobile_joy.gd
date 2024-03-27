extends Control
@onready var is_press=false
@onready var out_pos=Vector2.ZERO
@onready var out_joy=$out_joy
@onready var in_joy=$in_joy

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed==true:
			is_press=true
			out_pos=get_local_mouse_position()
		elif event.pressed==false:
			is_press=false

func _process(_delta):
	if is_press:
			if (get_local_mouse_position()-out_joy.position).length()>=50:
				out_joy.position=out_pos
				in_joy.position=out_joy.position-50*(out_joy.position-get_local_mouse_position()).normalized()
			else :
				in_joy.position=get_local_mouse_position()
	out_joy.visible=is_press
	in_joy.visible=is_press
