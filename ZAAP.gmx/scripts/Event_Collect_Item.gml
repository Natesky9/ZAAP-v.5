//only the server has to run this

if not am_server()
exit

for (var i = 0;i < ds_list_size(entity_list);i += 1)
    {
    var get_uuid = ds_list_find_value(entity_list,i)
    var get_entity = entity_from_uuid(get_uuid)
    var get_type = ds_get(get_entity,"type")
    //only do items
    if get_type != entity.item
    continue
    
    var get_x = ds_get(get_entity,"x")
    var get_y = ds_get(get_entity,"y")
    effect_create_above(ef_spark,get_x,get_y,0,c_white)
    }
