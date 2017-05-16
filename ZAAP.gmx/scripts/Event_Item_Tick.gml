///Event_Item_Tick()

var get_uuid = argument0
var get_entity = argument1
var get_type = entity.item

var get_pickup_timer = ds_get(get_entity,"pickup timer")
if get_pickup_timer
ds_add(get_entity,"pickup timer",-1)
