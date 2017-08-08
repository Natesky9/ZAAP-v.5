///Event_Bullet_Collision(uuid,entity)
//bullet collision step

var get_uuid = argument0
var get_entity = argument1

if not am_server()
exit

//only the server runs this
//timeout
var get_lifetime = ds_get(get_entity,"lifetime")
if get_lifetime == 1
    {
    //packet_entity_destroy
    packet_write(packet.entity_destroy,get_uuid)
    entity_destroy_basic(get_uuid)
    exit
    }
get_entity[? "lifetime"] = get_lifetime - 1
//end timeout

//collision
var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")
var get_source = ds_get(get_entity,"source")

var entity_ship_list = entity_list_from_type(entity.ship)

var entity_ship_list_size = ds_list_size(entity_ship_list)

for (var i = 0;i < ds_list_size(entity_list);i += 1)
    {
    var get_ship_uuid = ds_list_find_value(entity_ship_list,i)
    
    if get_ship_uuid == get_source
    continue //nothing to do here
    
    var get_ship_entity = entity_from_uuid(get_ship_uuid)
    
    var get_grid_x = x_to_grid_x(get_x,get_y,get_ship_entity)
    if get_grid_x == -1
    continue
    var get_grid_y = y_to_grid_y(get_x,get_y,get_ship_entity)
    if get_grid_y == -1
    continue
    
    var get_grid = grid_from_entity(get_ship_entity)
    var grid_value = grid_get_value(get_grid,get_grid_x,get_grid_y)
    
    if is_zero(grid_value)
    continue
    
    bullet_collide_with_ship(get_entity,get_uuid,get_ship_entity,get_ship_uuid)
    //end collision
    }

