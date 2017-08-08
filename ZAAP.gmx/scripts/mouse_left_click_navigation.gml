///mouse_left_click_navigation()
//event for the client left clicking
//for the navigation functions

if not am_client()
return false

var get_ship = get_ship_from_socket(SSS)
if not get_ship
    {
    console_add("no ship")
    return false
    }

var get_uuid = uuid_from_entity(get_ship)

var autopilot_status = ds_get(get_ship,"autopilot")

if autopilot_status
    {
    autopilot_add_node(get_uuid,"checkpoint",mouse_x,mouse_y)
    return true
    }
if not autopilot_status
    {
    if not keyboard_check(vk_shift)
        {
        console_add("hold shift and then click")
        console_add("to begin autopilot")
        return true
        }
    autopilot_start(get_uuid)
    autopilot_add_node(get_uuid,"waypoint",mouse_x,mouse_y)
    return true
    }
