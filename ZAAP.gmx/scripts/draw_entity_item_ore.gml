///draw_entity_item_rock(entity,x,y,heading,id)
//draws the rock item
var get_entity = argument0
var get_x = argument1
var get_y = argument2
var get_heading = argument3
var get_id = argument4

draw_set_color(grid_value_to_color(get_id))
draw_circle(get_x,get_y,16,false)
draw_set_color(c_black)
draw_circle(get_x,get_y,16,true)
/*
draw_set_color(c_white)
var get_texture = sprite_get_texture(stone_texture,0)
draw_primitive_begin_texture(pr_trianglefan,get_texture)
draw_vertex_texture(get_x,get_y,.5,.5)


var vert_x,vert_y
for (var i = 0;i <= 60;i++)
    {
    var length = 24 + 4*sin(pi * i / 30)*sin(i/3)
    var magnitude_x = lengthdir_x(1,get_heading+ i*6)
    var magnitude_y = lengthdir_y(1,get_heading+ i*6)
    vert_x = get_x + magnitude_x*length
    vert_y = get_y + magnitude_y*length
    
    var uv_x = lengthdir_x(.5,get_heading+i*6-135)+.5
    var uv_y = lengthdir_y(.5,get_heading+i*6-135)+.5
    
    draw_vertex_texture(vert_x,vert_y,uv_x,uv_y)
    
    
    }
draw_primitive_end()
*/
