var get_entity = entity_find_from_point(mouse_x,mouse_y,false)
if is_zero(get_entity)
return false

var get_uuid = uuid_from_entity(get_entity)
if is_zero(get_uuid)
return false

var get_grid = ds_get(get_entity,"grid")
if is_zero(get_grid)
return false

var grid_x = x_to_grid_x(mouse_x,mouse_y,get_entity)
var grid_y = y_to_grid_y(mouse_x,mouse_y,get_entity)

var get_value = grid_get_value(get_grid,grid_x,grid_y)
var new_value = irandom(10)

packet_write(packet.grid_set,get_uuid,grid_x,grid_y,new_value)
return true
