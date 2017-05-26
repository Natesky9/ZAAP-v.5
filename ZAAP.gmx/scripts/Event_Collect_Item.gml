///Event_Collect_Item()
//only the server has to run this
//rework
if not am_server()
exit

var get_uuid = argument0
var get_entity = argument1
var get_type = entity.ship

var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")

for (var i = 0;i < ds_list_size(entity_list);i += 1)
    {
    var get_list = ds_list_find_value(entity_list,i)
    for (var ii = 0;i < ds_list_size(get_list);i += 1)
        {
        var get_item_uuid = ds_list_find_value(get_list,ii)
        var get_item_entity = entity_from_uuid(get_item_uuid)
        var get_item_type = ds_get(get_item_entity,"type")
        //only do items
        if get_item_type != entity.item
        continue
        
        var get_pickup_timer = ds_get(get_item_entity,"pickup timer")
        if get_pickup_timer
        continue
        
        var get_item_x = ds_get(get_item_entity,"x")
        var get_item_y = ds_get(get_item_entity,"y")
        
        var x_dist = abs(get_x - get_item_x)
        if x_dist > 64 continue
        var y_dist = abs(get_y - get_item_y)
        if y_dist > 64 continue
        
        //packet_entity_destroy
        packet_write(packet.entity_destroy,get_item_uuid)
        entity_destroy_basic(get_item_uuid)
        effect_create_above(ef_ring,get_item_x,get_item_y,1,c_white)
        //do something here
        }
    }
