if !am_client()
and !am_server()
exit

for (var i = 0;i < ds_list_size(entity_list);i += 1)
    {
    var get_uuid = ds_list_find_value(entity_list,i)
    var get_entity = entity_from_uuid(get_uuid)
    
    if get_entity == 0
        {
        show("Error, entity does not exist!")
        continue
        }
        
    var get_thrust = ds_get(get_entity,"thrust");
    var get_steer = ds_get(get_entity,"steer");
    var get_brake = ds_get(get_entity,"brake");
    var get_x = ds_get(get_entity,"x");
    var get_y = ds_get(get_entity,"y");
    var get_direction = ds_get(get_entity,"direction");
    var get_speed = ds_get(get_entity,"speed");
    var get_heading = ds_get(get_entity,"heading");
    
    if get_steer != 0
        {
        get_entity[? "heading"] += get_steer*5
        //anytime you change the direction, mod to fit 360
        get_entity[? "heading"] = (get_entity[? "heading"] + 360) mod 360
        }
    if get_thrust != 0
        {
        //multiply by thrust amount
        var get_vector_thrust = 1/10
        
        
        //add the vector
        add_vector(get_entity,get_vector_thrust,get_heading)
        }
    if get_brake != 0
        {
        get_entity[? "speed"] /= 10
        }
    
    
    
    //move it
    get_entity[? "x"] += lengthdir_x(get_speed,get_direction) div true
    get_entity[? "y"] += lengthdir_y(get_speed,get_direction) div true
    
    }
