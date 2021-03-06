///entity_asteroid_break_cell(uuid,entity,grid,grid_x,grid_y)
//converts an asteroid cell into an item
var get_uuid = argument0
var get_entity = argument1
var get_grid = argument2
var get_grid_x = argument3
var get_grid_y = argument4

var get_heading = ds_get(get_entity,"heading")
var get_direction = ds_get(get_entity,"direction")
var get_speed = ds_get(get_entity,"speed")

var get_value = ds_grid_get(get_grid,get_grid_x,get_grid_y)

var coord = hex_cell_to_point(get_entity,get_grid_x,get_grid_y)
var new_x = coord[0]
var new_y = coord[1]


var new_uuid = entity_create_server(new_x,new_y,entity.item)
var new_entity = entity_from_uuid(new_uuid)
ds_set(new_entity,"id",get_value)
ds_set(new_entity,"pickup timer",60)
ds_set(new_entity,"heading",irandom(360))
ds_set(new_entity,"direction",get_direction + irandom(30) - 15)
ds_set(new_entity,"speed",get_speed + irandom(4))
//packet_entity_create
packet_write(packet.entity_create,new_uuid)

//clear the cell after everything is done
grid_set_value_advanced(get_uuid,get_entity,get_grid,get_grid_x,get_grid_y,false)
