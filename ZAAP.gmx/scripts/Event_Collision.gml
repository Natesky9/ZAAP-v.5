///Event_Collision()
if not am_client()
and not am_server()
exit

for (var i = 0;i < ds_list_size(entity_list);i += 1)
    {
    var get_list = ds_list_find_value(entity_list,i)
    for (var ii = 0;i < ds_list_size(get_list);i += 1)
        {
        var get_uuid = ds_list_find_value(get_list,i)
        var get_entity = entity_from_uuid(get_uuid)
        if is_zero(get_entity)
        continue
        //type is redundant and can now be moved to filter before the loop
        var get_type = get_entity[? "type"]
        
        switch get_type
            {
            //
            case entity.ship:
                {
                Event_Collect_Item(get_uuid,get_entity)
                break
                }
            //
            case entity.item:
                {
                Event_Item_Tick(get_uuid,get_entity)
                break
                }
            //
            case entity.bullet:
                {
                Event_Bullet_Collision(get_uuid,get_entity)
                break
                }
            //
            }
        }
    }
