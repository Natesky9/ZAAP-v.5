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
    
    var get_brake_speed = 1/10 //braking speed, set to ship's braking speed later
    
    var get_dest_x = ds_get(get_entity,"dest x")
    var get_dest_y = ds_get(get_entity,"dest y")
    
    var target_direction = point_direction(get_x,get_y,get_dest_x,get_dest_y)
    var target_distance = point_distance(get_x,get_y,get_dest_x,get_dest_y)
    
    //vector correction
    var entity_vector_x = lengthdir_x(target_distance/2,get_direction)
    var entity_vector_y = lengthdir_y(target_distance/2,get_direction)
    
    var target_vector_x = lengthdir_x(target_distance,target_direction)
    var target_vector_y = lengthdir_y(target_distance,target_direction)
    
    var corrected_vector_x = target_vector_x - entity_vector_x
    var corrected_vector_y = target_vector_y - entity_vector_y
    
    effect_create_above(ef_spark,get_x+corrected_vector_x,get_y+corrected_vector_y,0,c_orange)
    
    var corrected_vector_direction = point_direction(0,0,corrected_vector_x,corrected_vector_y)
    //end vector correction
    
    var target_angle_difference = angle_difference(corrected_vector_direction,get_heading)
    var abs_difference = abs(target_angle_difference)
    
    //steer
    if abs_difference >= 1
        {
        var steer_angle = sign(target_angle_difference)
        entity_issue_command(get_entity,"steer",steer_angle)
        }
    //steer done
    
    var brake_distance = additional_sum(get_speed,get_brake_speed)
    
    //thrust
    if abs_difference < 3
        {
        //stop steering
        entity_issue_command(get_entity,"steer",0)
        if target_distance > brake_distance//
            {
            entity_issue_command(get_entity,"thrust",1)
            entity_issue_command(get_entity,"brake",0)
            }
        if target_distance <= brake_distance//
            {
            console_add("brake")
            entity_issue_command(get_entity,"thrust",0)
            entity_issue_command(get_entity,"brake",1)
            }
        }
    if abs_difference >= 3
        {
        entity_issue_command(get_entity,"thrust",0)
        entity_issue_command(get_entity,"brake",0)
        }
    
    //check if reached the destination
    if abs(get_x - get_dest_x) < 4
    and abs(get_y - get_dest_y) < 4
        {
        console_add("Reached destination")
        console_add("Docking")
        autopilot_stop(get_uuid)
        entity_issue_command(get_entity,"brake",true)
        }
    //we're done here
    }
