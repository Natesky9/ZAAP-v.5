///Draw_Entity_Asteroid(entity)

var get_entity = argument0

var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")

var get_grid = grid_from_entity(get_entity)

if is_zero(get_grid)
    {
    //draw basic hexagon
    draw_asteroid_hex(get_entity,get_x,get_y)    
    }
    
if not is_zero(get_grid)
    {
    Draw_Asteroid_Grid_Vertex_Buffer(get_entity,get_x,get_y)
    }


font_align(5)
draw_text(get_x,get_y,"(>:3)")
