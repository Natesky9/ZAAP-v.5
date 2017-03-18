///Draw_Entity_Item(entity)

var get_entity = argument0

var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")

draw_set_color(c_blue)
draw_rectangle(get_x-8,get_y-8,get_x+8,get_y+8,false)
draw_set_color(c_black)
draw_rectangle(get_x-8,get_y-8,get_x+8,get_y+8,true)

font_align(5)
draw_text(get_x,get_y,"item")
