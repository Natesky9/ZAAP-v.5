///Draw_Asteroid_Grid_Vertex_Buffer(entity)

//do vertex stuff here
var get_entity = argument0
var get_x = argument1
var get_y = argument2
var get_heading = argument3
var get_vertex_buffer = ds_get(get_entity,"vertex buffer")

if is_zero(get_vertex_buffer)
    {
    get_vertex_buffer = entity_create_hex_vertex_buffer(get_entity)
    //done creating the vertex buffer
    }
    
if is_zero(get_vertex_buffer)
return false

vertex_submit(get_vertex_buffer,pr_trianglelist,-1)
//we're done here
return true
