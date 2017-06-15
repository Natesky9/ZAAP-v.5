///autopilot_stop(uuid)

var get_uuid = argument0



var get_entity = entity_from_uuid(get_uuid)

ds_set(get_entity,"autopilot",false)



var get_autopilot_list = ds_get(get_entity,"autopilot list")

ds_destroy(get_autopilot_list,ds_type_list)



var pos = ds_list_find_index(autopilot_controller_list,get_uuid)

ds_list_delete(autopilot_controller_list,pos)



console_add("Autopilot canceled")

entity_issue_command(get_entity,"autopilot",false)

entity_issue_command(get_entity,"steer",0)

entity_issue_command(get_entity,"thrust",0)

entity_issue_command(get_entity,"brake",0)

