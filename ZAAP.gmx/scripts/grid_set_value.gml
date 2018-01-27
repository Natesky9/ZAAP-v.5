///grid_set_value(entity,grid,x,y,value)
var get_entity = argument0;
var get_uuid = uuid_from_entity(get_entity)
var get_grid = argument1;
var get_grid_x = argument2;
var get_grid_y = argument3;
var get_value = argument4;
var get_type = ds_get(get_entity,"type");

get_grid[# get_grid_x,get_grid_y] = get_value

//update the vertex buffer
var get_vertex_buffer = ds_get(get_entity,"vertex buffer")
if not is_zero(get_vertex_buffer)
vertex_delete_buffer(get_vertex_buffer)

switch get_type
    {
    case entity.ship:
        {
        entity_create_grid_vertex_buffer(get_entity)
        break
        }
    case entity.asteroid:
        {
        show("recreating vertex buffer!")
        var success = entity_create_hex_vertex_buffer(get_entity)
        if not success
        entity_destroy_basic(get_uuid)
        break
        }
    default:
        {
        show("Error, entity does not have a type associated with a vertex buffer!")
        show("@grid_set_value with an entity type of: " + string(get_type))
        break
        }
    }
//we're done here
