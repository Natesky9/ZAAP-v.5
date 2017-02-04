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
            
            var get_lifetime = ds_get(get_entity,"lifetime")
            if get_lifetime == 1
                {
                packet_write(packet.entity_destroy,get_uuid)
                destroy_entity(get_uuid)
                break
                }
            get_entity[? "lifetime"] = get_lifetime - 1
            break
            }
        //
        }
    }
