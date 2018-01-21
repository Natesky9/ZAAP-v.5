///mouse_left_click_entity_server()

if not am_server()
exit

//find the entity
var get_uuid = entity_find_from_point(mouse_x,mouse_y,entity.types,false)
if is_zero(get_uuid)
return false

var get_entity = entity_from_uuid(get_uuid)
if is_zero(get_entity)
return false

var get_type = ds_get(get_entity,"type")

if get_uuid != get("selected entity")
    {
    var get_entity = entity_from_uuid(get_uuid)
    var get_type = ds_get(get_entity,"type")
    
    
    //if it is not the selected entity, make it so
    set("selected entity",get_uuid)
    set("selected entity type",get_type)
    console_add("selected new entity")
    return true
    }

//get the grid
var get_grid = grid_from_entity(get_entity)
if is_zero(get_grid)
return false

var get_width = ds_grid_width(get_grid)
var get_height = ds_grid_height(get_grid)

//if selected, modify the grid
switch get_type
    {
    case entity.ship:
        {
        var get_grid_x = x_to_grid_x(mouse_x,mouse_y,get_entity)
        var get_grid_y = y_to_grid_y(mouse_x,mouse_y,get_entity)
        }
    case entity.asteroid:
        {
        var grid_position = point_to_hex_grid(get_entity,mouse_x,mouse_y)
        var get_grid_x = grid_position[0]
        var get_grid_y = grid_position[1]
        }
    }


if not grid_in_bounds(get_width,get_height,get_grid_x,get_grid_y)
return false

//find the value of this point
var get_value = ds_grid_get(get_grid,get_grid_x,get_grid_y)


if keyboard_check(vk_shift)
    {
    //don't do anything if there isn't anything here
    if not get_value
    exit
    
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
    
    var new_uuid = entity_create_server(new_x,new_y,entity.item)
    var new_entity = entity_from_uuid(new_uuid)
    ds_set(new_entity,"id",item.square)
    ds_set(new_entity,"pickup timer",60)
    ds_set(new_entity,"heading",get_entity_heading)
    ds_set(new_entity,"direction",irandom(360))
    ds_set(new_entity,"speed",irandom(4))
    //packet_entity_create
    packet_write(packet.entity_create,new_uuid)
    
    grid_set_value_advanced(get_entity,get_grid,get_grid_x,get_grid_y,false)
    
    return true
    }

var random_value = irandom(5)
grid_set_value_advanced(get_entity,get_grid,get_grid_x,get_grid_y,random_value)
return true

