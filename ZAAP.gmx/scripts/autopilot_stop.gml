///autopilot_stop(uuid)

var get_uuid = argument0
var get_entity = entity_from_uuid(get_uuid)

if is_zero(get_entity)
    {
    console_add("error, no entity to stop autopilot on")
    exit
    }

ds_set(get_entity,"autopilot",false)


//remove the entity from autopilot
var autopilot_controller_list = ds_get(envar,"autopilot controller list")
var pos = ds_list_find_index(autopilot_controller_list,get_uuid)
ds_list_delete(autopilot_controller_list,pos)

//ds_destroy(get_autopilot_list,ds_type_list)

console_add("Autopilot canceled")

//destroy the entity's autopilot list
var get_autopilot_list = ds_get(get_entity,"autopilot list")
ds_destroy(ds_type_list,get_autopilot_list)
entity_issue_command(get_entity,"autopilot",false)

//reset the controls
entity_issue_command(get_entity,"steer",0)
entity_issue_command(get_entity,"thrust",0)
entity_issue_command(get_entity,"brake",0)


