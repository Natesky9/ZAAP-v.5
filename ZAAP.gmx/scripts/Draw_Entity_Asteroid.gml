///Draw_Entity_Asteroid(entity)

var get_entity = argument0

var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")

draw_asteroid_hex(get_entity,get_x,get_y)

font_align(5)
draw_text(get_x,get_y,"(>:3)")
