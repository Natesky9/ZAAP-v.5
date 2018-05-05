///Event_Motion()
if not am_client()
and not am_server()
exit



for (var i = 1;i < entity.types;i += 1)
    {
    var get_map = fetch_entity_map(i)
    if is_zero(get_map) continue
    
    var get_list = keys_from_map(get_map)
    for (var ii = 0;ii < ds_list_size(get_list);ii += 1)
        {
        
        //begin phase
        var get_uuid = ds_list_find_value(get_list,ii)
        var get_entity = entity_from_uuid(get_uuid)
        
        if get_entity == 0
            {
            show("Error, entity does not exist!")
            continue
            }
        
        //phase 1
        //pre movement get
        var get_thrust = ds_get(get_entity,"thrust");
        var get_steer = ds_get(get_entity,"steer");
        var get_brake = ds_get(get_entity,"brake");
        var get_x = ds_get(get_entity,"x");
        var get_y = ds_get(get_entity,"y");
        var get_type = ds_get(get_entity,"type");
        var get_direction = ds_get(get_entity,"direction");
        var get_speed = ds_get(get_entity,"speed");
        var get_heading = ds_get(get_entity,"heading");
        var is_docked = ds_get(get_entity,"docked");
        //end pre movement get
        
        //phase 2
        if is_docked
            {
            //special case for docked entites
            var get_target_entity = entity_from_uuid(is_docked)
            
            if get_target_entity
                {
                //if the target isn't docked to it anymore, reset
                get_target_dock = ds_get(get_target_entity,"docked")
                if get_target_dock != get_uuid
                    {
                    console_add("my dock isn't docked to me")
                    ds_set(get_entity,"docked",false)
                    continue
                    }
                
                var get_target_x = ds_get(get_target_entity,"x")
                var get_target_y = ds_get(get_target_entity,"y")
                var get_target_speed = ds_get(get_target_entity,"speed")
                var get_target_heading = ds_get(get_target_entity,"heading")
                var get_target_direction = ds_get(get_target_entity,"direction")
                
                //set motion based off of docked entity
                ds_set(get_entity,"x",get_target_x)
                ds_set(get_entity,"y",get_target_y)
                ds_set(get_entity,"speed",get_target_speed)
                ds_set(get_entity,"heading",get_target_heading)
                ds_set(get_entity,"direction",get_target_direction)
                
                continue
                }
            
            //the dock doesn't exist anymore, continue with the rest of the script
            console_add("my dock doesn't exist anymore!")
            ds_set(get_entity,"docked",false)
            }
        
        //phase 3
        if is_docked
            {
            //special case for entities that have something docked to them
            var get_docked_entity = entity_from_uuid(is_docked)
            
            if is_zero(get_docked_entity)
                {
                console_add("my entity doesn't exist anymore!")
                ds_set(get_entity,"docked",false)
                }
            //continue with the rest of the script
            }
        
        //phase 4
        if get_steer != 0
            {
            ds_add(get_entity,"heading",get_steer*4)
            }
        if get_thrust != 0
            {
            //multiply by thrust amount
            var get_vector_thrust = .1
            //add the vector
            entity_add_vector(get_entity,get_vector_thrust,get_heading)
            //thrust effect
            var thrust_x = get_x + lengthdir_x(16,get_heading+180)
            var thrust_y = get_y + lengthdir_y(16,get_heading+180)
            effect_create_above(ef_spark,thrust_x,thrust_y,1,c_white)
            //end thrust effect
            }
        if get_brake != 0
            {
            //brake action
            //reverse thrust
            entity_subtract_vector(get_entity,.2,get_heading)
            }
        
        //end phase
        //clamp it
        //Event_Motion_Clamp(get_entity)
        //end clamp it
        
        //move it
        get_speed = ds_get(get_entity,"speed")
        get_direction = ds_get(get_entity,"direction")
        
        ds_add(get_entity,"x",lengthdir_x(get_speed,get_direction))
        ds_add(get_entity,"y",lengthdir_y(get_speed,get_direction))
        
        //bop it
        
        //twist it
        }
    }
