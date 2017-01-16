var get_x = argument0
var get_y = argument1

for (var i = 0;i < ds_list_size(entity_list);i += 1)
    {
    var get_uuid = ds_list_find_value(entity_list,i)
    var get_entity = entity_from_uuid(get_uuid)
    var get_entity_x = ds_map_find_value(get_entity,"x")
    var get_entity_y = ds_map_find_value(get_entity,"y")
    
    if get_x < get_entity_x + 16
    and get_x > get_entity_x - 16
        {
        if get_y < get_entity_y + 16
        and get_y > get_entity_y - 16
            {
            return get_entity
            }
        }
    }
return undefined
