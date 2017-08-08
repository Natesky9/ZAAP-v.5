///grid_set_value_advanced(entity,grid,x,y,value)
//server side script for setting an entity's grid

var get_entity = argument0
var get_uuid = uuid_from_entity(get_entity)
var get_grid = argument1
var get_grid_x = argument2
var get_grid_y = argument3
var get_value = argument4

grid_set_value(get_entity,get_grid,get_grid_x,get_grid_y,get_value)
//packet_grid_set
packet_write(packet.grid_set,get_uuid,get_grid_x,get_grid_y,get_value)


//we're done here
