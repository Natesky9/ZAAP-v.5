//do vertex stuff here
var get_entity = argument0
var get_grid = ds_get(get_entity,"grid")
var get_vertex_buffer = ds_get(get_entity,"vertex buffer")

if is_zero(get_grid)
    {
    show("entity " + string(get_entity) + " does not have a grid!")
    exit
    }

if is_zero(get_vertex_buffer)
    {
    console_add("Creating vertex buffer")
    //create the vertex buffer
    var get_width = ds_grid_width(get_grid)
    var get_height = ds_grid_height(get_grid)
    
    var new_vertex_buffer = vertex_create_buffer()
    vertex_begin(new_vertex_buffer,basic_vertex_buffer_format)
    
    for (h = 0;h < get_height;h += 1)
        {
        for (w = 0;w < get_width;w += 1)
            {
            var get_grid_value = get_grid[# w, h]
            
            var get_x1 = ship_grid_size * w
            var get_y1 = ship_grid_size * h
            var get_x2 = get_x1 + ship_grid_size
            var get_y2 = get_y1 + ship_grid_size
            
            var get_grid_color = grid_value_to_color(get_grid_value)
            
            if not is_zero(get_grid_value)
            vertex_buffer_draw_square_tile(new_vertex_buffer,get_x1,get_y1,get_x2,get_y2,get_grid_color)
            //vertex_buffer_draw_rectangle(new_vertex_buffer,get_x1,get_y1,get_x2,get_y2,get_grid_color)
            }
        }
    vertex_end(new_vertex_buffer)
    vertex_freeze(new_vertex_buffer)
    ds_set(get_entity,"vertex buffer",new_vertex_buffer)
    //done creating the vertex buffer
    get_vertex_buffer = new_vertex_buffer
    }

vertex_submit(get_vertex_buffer,pr_trianglelist,-1)
//we're done here
