///Event_Autopilot()
if not am_client()
exit

//###//
//Autopilot in general needs work

//This code is client-only

//loop through all autopilot targets
var autopilot_controller_list = get("autopilot controller list")

for (var i = 0;i < ds_list_size(autopilot_controller_list);i += 1)
    {
    var get_uuid = ds_list_find_value(autopilot_controller_list,i)
    show("running autopilot for: " + string(get_uuid))
    
    var get_entity = entity_from_uuid(get_uuid)
    
    if is_zero(get_entity)
        {
        show("autopilot entity doesn't exist!")
        continue
        }
    
    var get_x = ds_get(get_entity,"x")
    var get_y = ds_get(get_entity,"y")
    var get_heading = ds_get(get_entity,"heading")
    var get_speed = ds_get(get_entity,"speed")
    var get_direction = ds_get(get_entity,"direction")
    
    var get_brake_speed = 1/2 //braking speed, set to ship's braking speed later
    
    //
    var get_autopilot_list = ds_get(get_entity,"autopilot list")
    var get_node = ds_list_find_value(get_autopilot_list,0)
    var get_type = ds_get(get_node,"type")
    switch get_type
        {
        case "dock":
            {
            var shipyard_uuid = ds_get(get_node,"dock")
            var get_shipyard = entity_from_uuid(shipyard_uuid)
            
            //work in vector correction here
            var get_dest_x = ds_get(get_shipyard,"x")
            var get_dest_y = ds_get(get_shipyard,"y")
            break
            }
        case "target":
            {
            //show("targeting entity")
            var get_target_uuid = ds_get(get_node,"target")
            //show("target: " + string(get_target_uuid))
            var get_target_entity = entity_from_uuid(get_target_uuid)
            //show("target entity: " + string(get_target_entity))
            if is_zero(get_target_entity)
                {
                console_add("target entity not exist")
                
                //
                effect_create_below(ef_ring,get_x,get_y,2,c_blue)
                ds_destroy(ds_type_map,get_node)
                ds_list_delete(get_autopilot_list,0)
                
                if is_zero(ds_list_size(get_autopilot_list))
                    {
                    //
                    show("enemy destroyed")
                    autopilot_add_node(get_uuid,"waypoint",0,0)
                    continue
                    }
                
                continue
                }
            
            var get_target_x = ds_get(get_target_entity,"x")
            var get_target_y = ds_get(get_target_entity,"y")
            
            var target_distance = point_direction(get_x,get_y,get_target_x,get_target_y)
            var target_direction = point_direction(get_x,get_y,get_target_x,get_target_y)
            
            var get_range_x = lengthdir_x(400,target_direction)
            var get_range_y = lengthdir_y(400,target_direction)
            
            var get_dest_x = get_target_x - get_range_x
            var get_dest_y = get_target_y - get_range_y
            
            //show("coordinates: " + string(get_dest_x) + ":" + string(get_dest_y))
            break
            }
        default:
            {
            var get_dest_x = ds_get(get_node,"x")
            var get_dest_y = ds_get(get_node,"y")
            break
            }
        }
    
    //effect_create_above(ef_spark,get_dest_x,get_dest_y,1,c_green)
    //
    
    var target_direction = point_direction(get_x,get_y,get_dest_x,get_dest_y)
    var target_distance = point_distance(get_x,get_y,get_dest_x,get_dest_y)
    
    //vector correction
    var entity_vector_x = lengthdir_x(get_speed*16,get_direction)
    var entity_vector_y = lengthdir_y(get_speed*16,get_direction)
    
    var target_vector_x = lengthdir_x(target_distance,target_direction)
    var target_vector_y = lengthdir_y(target_distance,target_direction)
    
    var corrected_vector_x = target_vector_x - entity_vector_x
    var corrected_vector_y = target_vector_y - entity_vector_y
    
    //effect_create_above(ef_spark,get_x+corrected_vector_x,get_y+corrected_vector_y,0,c_orange)
    
    target_direction = point_direction(0,0,corrected_vector_x,corrected_vector_y)
    target_distance = point_distance(0,0,corrected_vector_x,corrected_vector_y)
    
    //end vector correction
    
    var target_angle_difference = angle_difference(target_direction,get_heading)
    var abs_difference = abs(target_angle_difference)
    
    //steer
    if abs_difference >= 1
        {
        var steer_angle = sign(target_angle_difference)
        entity_issue_command(get_entity,"steer",steer_angle)
        }
    if abs_difference < 1
        {
        entity_issue_command(get_entity,"steer",0)
        }
    if abs_difference >= 5
        {
        entity_issue_command(get_entity,"brake",true)
        }
    //steer done
    
    var brake_distance = additional_sum(get_speed,get_brake_speed)
    //draw the brake distance
    var brake_x = get_x + lengthdir_x(brake_distance,get_direction)
    var brake_y = get_y + lengthdir_y(brake_distance,get_direction)
    
    effect_create_above(ef_spark,brake_x,brake_y,0,c_blue)
    //
    
    //thrust
    if abs_difference < 5
        {
        if target_distance > brake_distance
        and target_distance > 8
            {
            if get_speed < target_distance/10
            entity_issue_command(get_entity,"thrust",1)
            if get_speed >= target_distance/10
            entity_issue_command(get_entity,"thrust",0)
            
            entity_issue_command(get_entity,"brake",0)
            }
        if target_distance <= brake_distance//
        and get_type != "checkpoint"
            {
            entity_issue_command(get_entity,"thrust",0)
            entity_issue_command(get_entity,"brake",1)
            }
        }
    
    //check if reached the destination
    if ((get_type == "waypoint"
    or get_type == "dock")
    and abs(get_x - get_dest_x) < 16
    and abs(get_y - get_dest_y) < 16)
    or (get_type == "checkpoint"
    and abs(get_x - get_dest_x) < 64
    and abs(get_y - get_dest_y) < 64)
        {
        if get_type == "dock"
            {
            var get_dock = ds_get(get_node,"dock")
            
            if not is_zero(get_dock)
                {
                console_add("Docking")
                //packet_entity_dock
                packet_write(packet.entity_dock,get_uuid,get_dock)
                }
            }
        if get_type == "waypoint"
            {
            if get_speed >= 0
            continue
            }
        
        effect_create_below(ef_ring,get_dest_x,get_dest_y,1,c_blue)
        ds_destroy(ds_type_map,get_node)
        ds_list_delete(get_autopilot_list,0)
        
        if is_zero(ds_list_size(get_autopilot_list))
            {
            //
            console_add("Reached destination")
            autopilot_stop(get_uuid)
            //docked will take into account the entity it is docked to
            //
            }
        }
    //we're done here
    }
