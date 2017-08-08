///Event_Collect_Item()
//only the server has to run this
//rework
if not am_server()
exit

var get_uuid = argument0
var get_entity = argument1

var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")

//only search the item list
var get_list = entity_list_from_type(entity.item)
for (var i = 0;i < ds_list_size(get_list);i += 1)
    {
    var get_item_uuid = ds_list_find_value(get_list,i)
    var get_item_entity = entity_from_uuid(get_item_uuid)
    if is_zero(get_item_entity)
    continue
    
    var get_pickup_timer = ds_get(get_item_entity,"pickup timer")
    if get_pickup_timer
    continue
    
    var get_item_x = ds_get(get_item_entity,"x")
    var get_item_y = ds_get(get_item_entity,"y")
    
    //pickup range is 128, change later
    var x_dist = abs(get_x - get_item_x)
    if x_dist > 128 continue
    var y_dist = abs(get_y - get_item_y)
    if y_dist > 128 continue
    
    //at this point, the object has been picked up
    ds_set(get_item_entity,"pickup timer",true)
    var get_id = ds_get(get_item_entity,"id")
    switch get_id
        {
        case item.triangle:
            {
            break
            }
        case item.circle:
            {
            break
            }
        case item.square:
            {
            break
            }
        default:
            {
            show("test 3")
            //packet_inventory
            packet_write(packet.inventory,get_uuid)
            break
            }
        }
    effect_create_above(ef_ring,get_item_x,get_item_y,1,c_white)
    //packet_entity_destroy
    packet_write(packet.entity_destroy,get_item_uuid)
    entity_destroy_basic(get_item_uuid)
    show("marked for deletion " + string(get_entity))
    //do something here
    }
