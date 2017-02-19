///autopilot_start(uuid,x,y)
var get_uuid = argument0
var get_x = argument1
var get_y = argument2

var get_entity = entity_from_uuid(get_uuid)
var get_entity_x = ds_get(get_entity,"x")
var get_entity_y = ds_get(get_entity,"y")

//at some point, convert these to nav coordinates
ds_set(get_entity,"autopilot",true)
ds_set(get_entity,"dest x",get_x)
ds_set(get_entity,"dest y",get_y)
var dest_distance = point_distance(get_x,get_y,get_entity_x,get_entity_y)
ds_set(get_entity,"dest distance",dest_distance)

ds_list_add(autopilot_list,get_uuid)

console_add("Autopilot initiated")

entity_issue_command(get_entity,"autopilot",true)
