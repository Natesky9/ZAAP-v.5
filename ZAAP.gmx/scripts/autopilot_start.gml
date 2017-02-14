///autopilot_start(uuid,x,y)
var get_uuid = argument0
var get_x = argument1
var get_y = argument2

var get_entity = entity_from_uuid(get_uuid)

//at some point, convert these to nav coordinates
ds_set(get_entity,"autopilot",true)
ds_set(get_entity,"dest x",get_x)
ds_set(get_entity,"dest y",get_y)

ds_list_add(autopilot_list,get_uuid)
