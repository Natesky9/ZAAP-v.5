///bullet_collide_with_ship(bullet_entity,bullet_uuid,ship,ship_uuid)
//if it is a ship, double check the collision

var get_entity = argument0
var get_uuid = argument1
var collision_entity = argument2
var collision_uuid = argument3

var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")

var get_grid = ds_get(collision_entity,"grid")
get_grid_x = x_to_grid_x(get_x,get_y,collision_entity)
get_grid_y = y_to_grid_y(get_x,get_y,collision_entity)

if get_grid_x == -1
or get_grid_y == -1
exit //outside grid, no hit

var get_grid_value = grid_get_value(get_grid,get_grid_x,get_grid_y)
if not is_zero(get_grid_value)
    {
    console_add("entity hit")
    console_add("x: " + string(get_grid_x) + ",y: " + string(get_grid_y))
    
    packet_write(packet.grid_set,collision_uuid,get_grid_x,get_grid_y,0)
    grid_set_value(get_grid,get_grid_x,get_grid_y,0)
    
    var grid_max = ds_grid_get_max(get_grid,0,0,
    ds_grid_width(get_grid),ds_grid_height(get_grid))
    console_add("grid max is: " + string(grid_max))
    
    //check if the grid is empty
    if grid_max == 0
        {
        //if nothing there, destroy it
        packet_write(packet.entity_destroy,collision_uuid)
        entity_destroy_basic(collision_uuid)
        console_add("Entity destroyed because no grid")
        exit
        }
    
    //destroy the bullet
    packet_write(packet.entity_destroy,get_uuid)
    entity_destroy_basic(get_uuid)
    
    //spawn the destroyed cell as an item
    
    
    var collision_entity_x = ds_get(collision_entity,"x")
    var collision_entity_y = ds_get(collision_entity,"y")
    var collision_entity_heading = ds_get(collision_entity,"heading")
    
    var grid_width = ds_grid_width(get_grid)
    var grid_height = ds_grid_height(get_grid)
    
    var offset_x = grid_width * ship_grid_size / 2
    var offset_y = grid_width * ship_grid_size / 2
    
    var rotated_x = lengthdir_x(offset_x,collision_entity_heading)
    var rotated_y = lengthdir_y(offset_y,collision_entity_heading)
    
    var new_x = collision_entity_x - rotated_x + get_grid_x * ship_grid_size
    var new_y = collision_entity_y - rotated_y + get_grid_y * ship_grid_size
    
    var new_uuid = entity_create_advanced(new_x,new_y,entity.item)
    var new_entity = entity_from_uuid(new_uuid)
    ds_set(new_entity,"heading",collision_entity_heading)
    packet_write(packet.entity_create,new_uuid)
    }
//we're done with ship collisions
