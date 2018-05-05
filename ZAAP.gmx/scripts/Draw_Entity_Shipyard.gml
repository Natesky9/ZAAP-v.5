///Draw_Entity_Shipyard(entity)

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

var build_x = ds_get(get_entity,"build x")
var build_y = ds_get(get_entity,"build y")
var build_cell_x = ds_get(get_entity,"build cell x")
var build_cell_y = ds_get(get_entity,"build cell y")

//build cell
var cell_x1 = x1 + build_cell_x * 16
var cell_y1 = y1 + build_cell_y * 16
var cell_x2 = cell_x1 + 16
var cell_y2 = cell_y1 + 16
draw_set_color(c_green)
draw_rectangle(cell_x1,cell_y1,cell_x2,cell_y2,false)

//horizontal line
draw_set_color(c_black)
draw_line(x1,y1+build_y,x2,y1+build_y)
//vertical line
draw_line(x1+build_x,y1,x1+build_x,y2)


