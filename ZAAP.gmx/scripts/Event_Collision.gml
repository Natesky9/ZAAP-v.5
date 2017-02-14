///Event_Collision
if not am_client()
and not am_server()
exit

for (var i = 0;i < ds_list_size(entity_list);i += 1)
    {
    var get_uuid = ds_list_find_value(entity_list,i)
    var get_entity = entity_from_uuid(get_uuid)
    var get_type = get_entity[? "type"]
    
    switch get_type
        {
        //
        case entity.ship:
            {
            break
            }
        case entity.bullet:
            {
            if not am_server()
            break
            
            //timeout
            var get_lifetime = ds_get(get_entity,"lifetime")
            if get_lifetime == 1
                {
                packet_write(packet.entity_destroy,get_uuid)
                entity_destroy_basic(get_uuid)
                break
                }
            get_entity[? "lifetime"] = get_lifetime - 1
            //end timeout
            
            //collision
            var get_x = ds_get(get_entity,"x")
            var get_y = ds_get(get_entity,"y")
            var get_source = ds_get(get_entity,"source")
            //show("source is: " + string(get_source))
//something here is broken
            var collision_entity = entity_find_from_point(get_x,get_y)
            var collision_uuid = uuid_from_entity(collision_entity)
            //show("collision is: " + string(collision_uuid))
            
            if not is_zero(collision_entity)
            and collision_uuid != get_source
            and collision_uuid != get_uuid
                {
                packet_write(packet.entity_destroy,collision_uuid)
                packet_write(packet.entity_destroy,get_uuid)
                entity_destroy_basic(collision_uuid)
                entity_destroy_basic(get_uuid)
                }
            //end collision
            }
        //
        }
    }
