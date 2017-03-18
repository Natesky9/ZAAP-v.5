var get_uuid = argument0
var get_entity = argument1

if not am_server()
exit
//only the server runs this
//timeout
var get_lifetime = ds_get(get_entity,"lifetime")
if get_lifetime == 1
    {
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

var collision_entity = entity_find_from_point(get_x,get_y,get_entity)
if is_zero(collision_entity)
exit

var collision_uuid = uuid_from_entity(collision_entity)
if collision_uuid == get_source
exit //nothing to do here

//now check against the type
var get_collided_type = ds_get(collision_entity,"type")

//we assume that the entity was hit
var get_grid_x,get_grid_y

switch get_collided_type
    {
    //
    case entity.ship:
        {bullet_collide_with_ship(get_entity,get_uuid,collision_entity,collision_uuid);exit}
    //
    default:
        {bullet_collide_with_other(get_entity,get_uuid,collision_entity,collision_uuid);exit}
    //
    }


//end collision

