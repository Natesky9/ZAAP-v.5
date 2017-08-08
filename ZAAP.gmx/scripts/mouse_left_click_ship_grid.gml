///mouse_left_click_ship_grid()
//###//
//this needs help


var get_uuid = entity_find_from_point(mouse_x,mouse_y,false)
if is_zero(get_uuid)
return false

var get_entity = entity_from_uuid(get_uuid)
if is_zero(get_entity)
return false

var get_grid = grid_from_entity(get_entity)
if is_zero(get_grid)
return false

var is_docked = ds_get(get_entity,"docked to")
if is_zero(is_docked)
and not keyboard_check(vk_control)
    {
    console_add("You must be docked")
    console_add("to edit your ship!")
    return true
    }

var get_grid_x = x_to_grid_x(mouse_x,mouse_y,get_entity)
var get_grid_y = y_to_grid_y(mouse_x,mouse_y,get_entity)

var get_value = grid_get_value(get_grid,get_grid_x,get_grid_y)
var new_value = irandom(10)
//packet_grid_set
packet_write(packet.grid_set,get_uuid,get_grid_x,get_grid_y,new_value)

return true
