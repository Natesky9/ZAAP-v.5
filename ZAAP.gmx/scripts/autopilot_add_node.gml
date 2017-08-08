///autopilot_add_node(uuid,type,x,y)
//types are:
//checkpoint, waypoint, entity, dock

var get_uuid = argument[0]
var get_type = argument[1]

var get_entity = entity_from_uuid(get_uuid)
var get_autopilot_list = ds_get(get_entity,"autopilot list")
if is_zero(get_autopilot_list)
    {
    console_add(string(get_uuid) + " does not have an autopilot list")
    exit
    }

//create the node and add to list
var get_node = ds_create(ds_type_map)
ds_list_add(get_autopilot_list,get_node)
//add the node type
ds_set(get_node,"type",get_type)

switch get_type
    {
    case "dock":
        {
        var get_target = argument[2]
        ds_set(get_node,"target",get_target)
        break
        }
    //
    case "checkpoint":
    case "waypoint":
        {
        var get_x = argument[2]
        var get_y = argument[3]
        ds_set(get_node,"x",get_x)
        ds_set(get_node,"y",get_y)
        break
        }
    //
    case "entity":
        {
        //change this to mimic "dock"
        var get_target = argument[2]
        var get_entity = entity_from_uuid(get_target)
        var get_x = ds_get(get_entity,"x")
        var get_y = ds_get(get_entity,"y")
        ds_set(get_node,"x",get_x)
        ds_set(get_node,"y",get_y)
        break
        }
    }
console_add("node added")
