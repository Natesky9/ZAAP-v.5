//only the server has to run this

if not am_server()
exit

for (var i = 0;i < ds_list_size(entity_list);i += 1)
    {
    var get_uuid = ds_list_find_value(entity_list,i)
    var get_entity = entity_from_uuid(get_uuid)
    var get_type = ds_get(get_entity,"type")
    //only do ships
    if get_type != entity.ship
    continue
    
    var get_x = ds_get(get_entity,"x")
    var get_y = ds_get(get_entity,"y")
    effect_create_above(ef_spark,get_x,get_y,0,c_white)
    
    for (var ii = 0;ii < ds_list_size(entity_list);ii += 1)
        {
        var get_item_uuid = ds_list_find_value(entity_list,ii)
        var get_item_entity = entity_from_uuid(get_item_uuid)
        var get_item_type = ds_get(get_item_entity,"type")
        //only do items
        if get_item_type != entity.item
        continue
        
        var get_item_x = ds_get(get_item_entity,"x")
        var get_item_y = ds_get(get_item_entity,"y")
        
        var x_dist = abs(get_x - get_item_x)
        if x_dist > 16 continue
        var y_dist = abs(get_y - get_item_y)
        if y_dist > 16 continue
        
        packet_write(packet.entity_destroy,get_item_uuid)
        entity_destroy_basic(get_item_uuid)
        effect_create_above(ef_ring,get_item_x,get_item_y,1,c_white)
        //do something here
        }
    }
