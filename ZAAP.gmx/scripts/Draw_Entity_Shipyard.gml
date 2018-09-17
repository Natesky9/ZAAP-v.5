///Draw_Entity_Shipyard(entity)

var get_entity = argument0

var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")

var docked = entity_is_docked(get_entity)

if docked
    {
    var docked_entity = entity_from_uuid(docked)
    var docked_grid = grid_from_entity(docked_entity)
    var docked_width = ds_grid_width(docked_grid)
    var docked_height = ds_grid_height(docked_grid)
    
    var docked_x_offset = mean(0,docked_width*32)
    var docked_y_offset = mean(0,docked_height*32)
    var x1 = get_x - docked_x_offset
    var y1 = get_y - docked_y_offset
    var x2 = get_x + docked_x_offset
    var y2 = get_y + docked_y_offset
    }
else
    {
    var x1 = get_x-128
    var y1 = get_y-128
    var x2 = get_x+128
    var y2 = get_y+128
    }

draw_set_color(c_orange)
draw_rectangle(x1-8,y1-8,x2+8,y2+8,false)
draw_set_color(c_black)
draw_rectangle(x1-8,y1-8,x2+8,y2+8,true)

draw_set_color(c_blue)
draw_rectangle(x1,y1,x2,y2,false)
draw_set_color(c_black)
draw_rectangle(x1,y1,x2,y2,true)

var build_x = ds_get(get_entity,"build x")
var build_y = ds_get(get_entity,"build y")
var build_cell_x = ds_get(get_entity,"build cell x")
var build_cell_y = ds_get(get_entity,"build cell y")

//horizontal line
draw_set_color(c_red)
//horizontal and vertical inside
draw_rectangle(x1,y1+build_y-4,x2,y1+build_y+4,false)
draw_rectangle(x1+build_x-4,y1,x1+build_x+4,y2,false)
draw_set_color(c_black)
//horizontal and vertical border
draw_rectangle(x1,y1+build_y-4,x2,y1+build_y+4,true)
draw_rectangle(x1+build_x-4,y1,x1+build_x+4,y2,true)

//build cell
var cell_x1 = x1 + build_cell_x * 32
var cell_y1 = y1 + build_cell_y * 32
var cell_x2 = cell_x1 + 32
var cell_y2 = cell_y1 + 32
draw_set_color(c_green)
draw_rectangle(cell_x1,cell_y1,cell_x2,cell_y2,false)


//move the build lines
var expected_build_x = build_cell_x * 32 + 16
var expected_build_y = build_cell_y * 32 + 16

var build_motion_x = sign(expected_build_x - build_x)
var build_motion_y = sign(expected_build_y - build_y)

ds_add(get_entity,"build x",build_motion_x)
ds_add(get_entity,"build y",build_motion_y)

