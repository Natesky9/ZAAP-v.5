///autopilot_stop(uuid)
var get_uuid = argument0

var get_entity = entity_from_uuid(get_uuid)
ds_set(get_entity,"autopilot",false)



var pos = ds_list_find_index(autopilot_list,get_uuid)
ds_list_delete(autopilot_list,pos)
