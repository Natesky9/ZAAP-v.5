///grid_set_value(entity,grid,x,y,value)
var get_entity = argument0;
var get_grid = argument1;
var get_grid_x = argument2;
var get_grid_y = argument3;
var get_value = argument4;

get_grid[# get_grid_x,get_grid_y] = get_value

//update the vertex buffer
var get_vertex_buffer = ds_get(get_entity,"vertex buffer")
if not is_zero(get_vertex_buffer)
vertex_delete_buffer(get_vertex_buffer)
entity_create_vertex_buffer(get_entity)
//we're done here
