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

//only search the item list
var get_list = ds_get(envar,entity.item)
for (var ii = 0;ii < ds_list_size(get_list);ii += 1)
    {
    var get_item_uuid = ds_list_find_value(get_list,ii)
    var get_item_entity = entity_from_uuid(get_item_uuid)
    if is_zero(get_item_entity)
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
    
    //at this point, the object has been picked up
    var get_id = ds_get(get_item_entity,"id")
    switch get_id
        {
        case item.triangle:
            {
            entity_inventory_add(get_uuid,item.triangle,1)
            break
            }
        case item.circle:
            {
            entity_inventory_add(get_uuid,item.circle,1)
            break
            }
        case item.square:
            {
            entity_inventory_add(get_uuid,item.square,1)
            break
            }
        default:
            {
            show("error, item didn't have a type!")
            console_add("error, no type in item")
            continue
            }
        }
    effect_create_above(ef_ring,get_item_x,get_item_y,1,c_white)
    //packet_entity_destroy
    packet_write(packet.entity_destroy,get_item_uuid)
    entity_destroy_basic(get_item_uuid)
    //do something here
    }
