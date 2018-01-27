///grid_set_value_advanced(uuid,entity,grid,x,y,value)
//server side script for setting an entity's grid

var get_uuid = argument0
var get_entity = argument1
var get_grid = argument2
var get_grid_x = argument3
var get_grid_y = argument4
var get_value = argument5

var get_type = ds_get(get_entity,"type")

grid_set_value(get_entity,get_grid,get_grid_x,get_grid_y,get_value)
//packet_grid_set
packet_write(packet.grid_set,get_uuid,get_grid_x,get_grid_y,get_value)

if not get_value
    {
    //test for breaks
    switch get_type
        {
        case entity.asteroid:
            {
            parse_asteroid(get_uuid,get_entity,get_grid,get_grid_x,get_grid_y)
            break
            }
        case entity.ship:
            {
            break
            }
        }
    }

//we're done here
