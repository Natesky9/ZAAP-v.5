///Event_Collision()
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
            Event_Collect_Item()
            break
            }
        case entity.bullet:
            {
            Event_Bullet_Collision(get_uuid,get_entity)
            break
            }
        //
        }
    }
