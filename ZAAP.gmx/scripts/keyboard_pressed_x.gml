///keyboard_pressed_x()

if not keyboard_check_pressed(ord('X'))
exit

if am_client()
    {
    //console_add("Started Autopilot")
    var get_ship = get_ship_from_socket(get("SSS"))
    if is_zero(get_ship)
        {
        console_add("no ship, autopilot canceled")
        exit
        }
    
    var get_uuid = uuid_from_entity(get_ship)
    
    var autopilot_status = ds_get(get_ship,"autopilot")
    if autopilot_status == true
        {
        autopilot_stop(get_uuid)
        exit
        }
    var is_docked = ds_get(get_ship,"docked")
    if is_docked
        {
        //###//
        //change this to used the new docked mechanic
        entity_issue_command(get_ship,"docked",false)
        entity_issue_command(get_ship,"brake",false)
        exit
        }
    
    
    var get_x = ds_get(get_ship,"x")
    var get_y = ds_get(get_ship,"y")
    
    var nearest_shipyard = entity_find_nearest(entity.shipyard,get_x,get_y,get_uuid)
    if is_zero(nearest_shipyard)
        {
        console_add("no shipyard nearby, autopilot canceled")
        exit
        }
    
    var shipyard_uuid = uuid_from_entity(nearest_shipyard)
    var get_shipyard_x = ds_get(nearest_shipyard,"x")
    var get_shipyard_y = ds_get(nearest_shipyard,"y")
    
    autopilot_start(get_uuid)
    autopilot_add_node(get_uuid,"waypoint",get_shipyard_x-128,get_shipyard_y)
    autopilot_add_node(get_uuid,"checkpoint",get_shipyard_x,get_shipyard_y-128)
    autopilot_add_node(get_uuid,"checkpoint",get_shipyard_x+128,get_shipyard_y)
    autopilot_add_node(get_uuid,"waypoint",get_shipyard_x,get_shipyard_y+128)
    autopilot_add_node(get_uuid,"dock",shipyard_uuid)
    }
