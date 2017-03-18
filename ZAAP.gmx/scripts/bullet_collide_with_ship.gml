///bullet_collide_with_ship(bullet,bullet_uuid,ship,ship_uuid)
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
    hit = true
    console_add("entity hit")
    console_add("x: " + string(get_grid_x) + ",y: " + string(get_grid_y))
    
    var grid_max = ds_grid_get_max(get_grid,0,0,
    ds_grid_width(get_grid),ds_grid_height(get_grid))
    console_add("grid max is: " + string(grid_max))

    if grid_max > 0
        {
        packet_write(packet.grid_set,collision_uuid,get_grid_x,get_grid_y,0)
        grid_set_value(get_grid,get_grid_x,get_grid_y,0)
        }
    if grid_max == 0
        {
        //if nothing there, destroy it
        packet_write(packet.entity_destroy,get_uuid)
        entity_destroy_basic(get_uuid)
        packet_write(packet.entity_destroy,collision_uuid)
        entity_destroy_basic(collision_uuid)
        console_add("Entity destroyed because no grid")
        exit
        }
    }
//we're done with ship collisions
