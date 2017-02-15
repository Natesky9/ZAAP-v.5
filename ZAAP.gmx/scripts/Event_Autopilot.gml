if not am_client()
exit

//This code is client-only

//loop through all autopilot targets

for (var i = 0;i < ds_list_size(autopilot_list);i += 1)
    {
    var get_uuid = ds_list_find_value(autopilot_list,i)
    
    var get_entity = entity_from_uuid(get_uuid)
    
    var get_x = ds_get(get_entity,"x")
    var get_y = ds_get(get_entity,"y")
    var get_heading = ds_get(get_entity,"heading")
    var get_speed = ds_get(get_entity,"speed")
    var get_direction = ds_get(get_entity,"direction")
    
    
    var get_dest_x = ds_get(get_entity,"dest x")
    var get_dest_y = ds_get(get_entity,"dest y")
    
    var target_direction = point_direction(get_x,get_y,get_dest_x,get_dest_y)
    var target_distance = point_distance(get_x,get_y,get_dest_x,get_dest_y)
    
    var target_angle_difference = angle_difference(target_direction,get_heading)
    var abs_difference = abs(target_angle_difference)
    console_add("angle: " + string(abs_difference))
    
    //steer
    if abs_difference >= 5
        {
        var steer_angle = sign(target_angle_difference)
        packet_write(packet.issue_command,"steer",steer_angle)
        }
    if abs_difference < 5
        {
        packet_write(packet.issue_command,"steer",0)
        }
    //steer done
    
    //thrust
    if abs_difference < 5
        {
        if get_speed < (target_distance/get_speed/10) + 10
            {
            console_add("thrust")
            packet_write(packet.issue_command,"thrust",1)
            packet_write(packet.issue_command,"brake",0)
            }
        if get_speed >= (target_distance/get_speed/10) - 10
            {
            console_add("brake")
            packet_write(packet.issue_command,"thrust",0)
            packet_write(packet.issue_command,"brake",1)
            }
        }
    if abs_difference >= 5
        {
        packet_write(packet.issue_command,"thrust",0)
        packet_write(packet.issue_command,"brake",0)
        }
    
    //check if reached the destination
    if abs(get_x - get_dest_x) < 4
    and abs(get_y - get_dest_y) < 4
        {
        console_add("Reached destination")
        console_add("Docking")
        autopilot_stop(get_uuid)
        packet_write(packet.issue_command,"brake",true)
        }
    
    }
