///entity_create_hex_vertex_buffer(entity)
var get_entity = argument0

var get_grid = grid_from_entity(get_entity)

if is_zero(get_grid)
    {
    //early exit if no grid
    show("entity " + string(get_entity) + " does not have a grid!")
    return false
    }
var get_width = ds_grid_width(get_grid)
var get_height = ds_grid_height(get_grid)

var max_value = ds_grid_get_max(get_grid,0,0,get_width,get_height)
if max_value == 0
    {
    show("grid doesn't contain anything")
    console_add("Grid doesn't contain anything!")
    return false
    }

//start drawing the vertex buffer
var new_vertex_buffer = vertex_create_buffer()
vertex_begin(new_vertex_buffer,basic_vertex_buffer_format)
for (h = 0;h < get_height;h += 1)
    {
    for (w = 0;w < get_width;w += 1)
        {
        var get_grid_value = get_grid[# w, h]
        
        
        if not is_zero(get_grid_value)
            {
            vertex_buffer_draw_hex_tile(get_grid,new_vertex_buffer,w,h,get_grid_value)
            show("drew triangle")
            }
        }
    //
    }

vertex_end(new_vertex_buffer)
vertex_freeze(new_vertex_buffer)
ds_set(get_entity,"vertex buffer",new_vertex_buffer)
//we're done here
return new_vertex_buffer
