var get_entity = argument0

var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")

draw_set_color(c_gray)
draw_circle(get_x,get_y,32,false)
draw_set_color(c_black)
draw_circle(get_x,get_y,32,true)

font_align(5)
draw_text(get_x,get_y,"(>:3)")
