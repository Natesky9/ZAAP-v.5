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

var m_x = window_mouse_get_x()
var m_y = window_mouse_get_y()
//
element_add(m_x,m_y,get_entity,"entity " + string(get_uuid),ds_type_map)
//
var get_type = ds_get(get_entity,"type")

if get_uuid != get("selected entity")
    {
    var get_entity = entity_from_uuid(get_uuid)
    var get_type = ds_get(get_entity,"type")
    
    
    //if it is not the selected entity, make it so
    set("selected entity",get_uuid)
    set("selected type",get_type)
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
        break
        }
    case entity.asteroid:
        {
        var grid_position = point_to_hex_grid(get_entity,mouse_x,mouse_y)
        var get_grid_x = grid_position[0]
        var get_grid_y = grid_position[1]
        break
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
    
    switch get_type
        {
        case entity.ship:
            {
            break
            }
        case entity.asteroid:
            {
            entity_asteroid_break_cell(get_uuid,get_entity,get_grid,get_grid_x,get_grid_y)
            break
            }
        }

    return true
    }

var random_value = irandom(5)
grid_set_value_advanced(get_uuid,get_entity,get_grid,get_grid_x,get_grid_y,random_value)
return true

