///Event_Motion
if not am_client()
and not am_server()
exit

for (var i = 0;i < ds_list_size(entity_list);i += 1)
    {
    var get_list = ds_list_find_value(entity_list,i)
    for (var ii = 0;ii < ds_list_size(get_list);ii += 1)
        {
        var get_uuid = ds_list_find_value(get_list,ii)
        var get_entity = entity_from_uuid(get_uuid)
        
        if get_entity == 0
            {
            show("Error, entity does not exist!")
            continue
            }
        
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
        var is_docked = ds_get(get_entity,"docked to");
        //end pre movement get
        
        if is_docked
            {
            //special case for docked entites
            var get_target_entity = uuid_from_entity(is_docked)
            
            //if the target isn't docked to it anymore, reset
            get_target_dock = ds_get(get_target_entity,"dock")
            
            if get_target_dock != get_uuid
                {
                console_add("my dock isn't docked to me")
                ds_set(get_entity,"docked to",false)
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
        if get_steer != 0
            {
            get_entity[? "heading"] += get_steer*4
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
            
        //clamp it
        Event_Motion_Clamp(get_entity)
        //end clamp it
        
        //move it
        get_speed = ds_get(get_entity,"speed")
        get_direction = ds_get(get_entity,"direction")
        
        get_entity[? "x"] += lengthdir_x(get_speed,get_direction)
        get_entity[? "y"] += lengthdir_y(get_speed,get_direction)
        
        //bop it
        
        //twist it
        }
    }
