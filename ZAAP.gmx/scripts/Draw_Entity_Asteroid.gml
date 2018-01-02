///Draw_Entity_Asteroid(entity)

var get_uuid = argument0
var get_entity = argument1

var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")
var get_heading = ds_get(get_entity,"heading")

var get_grid = grid_from_entity(get_entity)
var vertex_buffer = ds_get(get_entity,"vertex buffer")

//get ready to draw
transform_set_asteroid_orientation(get_x,get_y,get_heading+90,get_grid)
//transform_set_ship_orientation(get_x,get_y,90,get_grid)

drawn = Draw_Asteroid_Grid_Vertex_Buffer(get_entity,get_x,get_y,get_heading)

//draw the debug grid
if keyboard_check(vk_shift)
draw_entity_asteroid_grid(get_entity,get_grid,get_heading)

//finished drawing
d3d_transform_set_identity()
//end drawing the entity

if not drawn
drawn = draw_asteroid_hex(get_x,get_y,get_heading)

if not drawn
    {
    console_add("asteroid has no grid!")
    if am_server()
        {
        entity_destroy_basic(get_uuid)
        exit
        }
    }





font_align(5)

//draw_text(get_x,get_y,"(>:3)")

//draw_line(get_x,get_y,mouse_x,mouse_y)
