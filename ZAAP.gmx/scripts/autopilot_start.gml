///autopilot_start(uuid)
var get_uuid = argument0

var get_entity = entity_from_uuid(get_uuid)

var autopilot_controller_list = get("autopilot controller list")

//at some point, convert these to nav coordinates
ds_set(get_entity,"autopilot",true)
ds_list_add(autopilot_controller_list,get_uuid)

//create the list
var new_waypoint_list = ds_create(data.dynamic,ds_type_list)
ds_set(get_entity,"autopilot list",new_waypoint_list)


console_add("Autopilot initiated")

entity_issue_command(get_entity,"autopilot",true)

