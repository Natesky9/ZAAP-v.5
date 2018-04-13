///mouse_left_click_autopilot_add_node()
//add a node


var get_ship = my_ship()
if is_zero(get_ship)
    {
    console_add("no ship, no autopilot")
    return false
    }

var get_uuid = uuid_from_entity(get_ship)
if is_zero(get_ship)
return false

var autopilot_status = ds_get(get_ship,"autopilot")

if autopilot_status
    {
    console_add("adding node")
    autopilot_add_node(get_uuid,"checkpoint",mouse_x,mouse_y)
    return true
    }
if not autopilot_status
    {
    console_add("starting autopilot")
    autopilot_start(get_uuid)
    autopilot_add_node(get_uuid,"waypoint",mouse_x,mouse_y)
    return true
    }

//return false
