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

var is_docked = ds_get(get_entity,"docked")
if is_zero(is_docked)
and not keyboard_check(vk_control)
    {
    console_add("You must be docked")
    console_add("to edit your ship!")
    return true
    }

var get_grid_x = x_to_grid_x(mouse_x,mouse_y,get_entity)
var get_grid_y = y_to_grid_y(mouse_x,mouse_y,get_entity)

if am_server()
    {
    if get_grid_x == -1
    or get_grid_y == -1
    return false
    
    //manually break the grid value
    var get_entity_x = ds_get(get_entity,"x")
    var get_entity_y = ds_get(get_entity,"y")
    var get_entity_heading = ds_get(get_entity,"heading")
    
    var grid_width = ds_grid_width(get_grid);
    var grid_height = ds_grid_height(get_grid);
    
    var offset_x = (-grid_width) * (ship_grid_size / 2);
    var offset_y = (-grid_height) * (ship_grid_size / 2);
    
    var real_x = offset_x + (get_grid_x * ship_grid_size);
    var real_y = offset_y + (get_grid_y * ship_grid_size);
    
    var real_distance = point_distance(0,0,real_x,real_y);
    var real_direction = point_direction(0,0,real_x,real_y) - 90;
    
    var rotated_x = lengthdir_x(real_distance,real_direction + get_entity_heading)
    var rotated_y = lengthdir_y(real_distance,real_direction + get_entity_heading)
    
    var new_x = get_entity_x + rotated_x
    var new_y = get_entity_y + rotated_y
    
    var new_uuid = entity_create_advanced(new_x,new_y,entity.item)
    var new_entity = entity_from_uuid(new_uuid)
    ds_set(new_entity,"id",item.square)
    ds_set(new_entity,"pickup timer",60)
    ds_set(new_entity,"heading",get_entity_heading)
    ds_set(new_entity,"direction",irandom(360))
    ds_set(new_entity,"speed",irandom(4))
    //packet_entity_create
    packet_write(packet.entity_create,new_uuid)
    
    grid_set_value_advanced(new_entity,get_grid,get_grid_x,get_grid_y,false)
    
    return true
    }

var get_value = grid_get_value(get_grid,get_grid_x,get_grid_y)
var new_value = irandom(10)
//packet_grid_set
packet_write(packet.grid_set,get_uuid,get_grid_x,get_grid_y,new_value)

return true
