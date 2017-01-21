if !am_client()
or !am_server()
exit

for (var i = 0;i < ds_list_size(entity_list);i += 1)
    {
    var get_uuid = ds_list_find_value(entity_list,i)
    var get_entity = entity_from_uuid(get_uuid)
    
    if get_entity == -1
    or get_entity == undefined
        {
        show("Error, entity does not exist!")
        continue
        }
    var get_x = ds_map_find_value(get_entity,"x");
    var get_y = ds_map_find_value(get_entity,"y");
    var get_xspd = ds_map_find_value(get_entity,"xspd");
    var get_yspd = ds_map_find_value(get_entity,"yspd");
    
    get_entity[? "x"] += get_xspd
    get_entity[? "y"] += get_yspd
    }
