///Event_Mouse()

if mouse_check_button_pressed(mb_left)
    {
    if am_server()
        {
        var done
        //do done checks
        
        done = mouse_left_click_entity_list()
        if done exit
        
        done = mouse_left_click_ship_grid()
        if done exit
        
        done = mouse_create()
        if done exit

        exit
        }
    if am_client()
        {
        //
        done = mouse_left_click_entity_list()
        if done exit
        
        done = mouse_left_click_ship_grid()
        if done exit
        //
        var get_ship = get_ship_from_socket(SSS)
        if not get_ship exit
        
        var get_uuid = uuid_from_entity(get_ship)
        
        var autopilot_status = ds_get(get_ship,"autopilot")
        
        if autopilot_status
            {
            autopilot_add_node(get_uuid,"checkpoint",mouse_x,mouse_y)
            exit
            }
        if not autopilot_status
            {
            autopilot_start(get_uuid)
            autopilot_add_node(get_uuid,"waypoint",mouse_x,mouse_y)
            }
        }
    }
//
if mouse_check_button_pressed(mb_right)
    {
    if am_server()
        {
        done = mouse_right_click_entity_list()
        if done exit
        
        
        var get_entity = entity_find_from_point(mouse_x,mouse_y,false)
            {
            if get_entity != 0
                {
                var get_uuid = uuid_from_entity(get_entity)
                console_add("get_entity is: " + string(get_entity))
                //packet_entity_destroy
                packet_write(packet.entity_destroy,get_uuid)
                entity_destroy_basic(get_uuid)
                console_add("destroyed " + string(get_uuid))
                exit
                }
            }
        }
    //
    }
