var get_entity = argument0

var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")


var x1 = get_x-48
var y1 = get_y-48
var x2 = get_x+48
var y2 = get_y+48

draw_set_color(c_blue)
draw_rectangle(x1,y1,x2,y2,false)
draw_set_color(c_black)
draw_rectangle(x1,y1,x2,y2,true)
