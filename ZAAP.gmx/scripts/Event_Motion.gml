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
        
    var get_thrust = get_entity[? "thrust"];
    var get_steer = get_entity[? "steer"];
    var get_brake = get_entity[? "brake"];
    
    if get_steer != 0
        {
        get_entity[? "direction"] += get_steer*5
        //anytime you change the direction, mod to fit 360
        get_entity[? "direction"] = (get_entity[? "direction"] + 360) mod 360
        }
    if get_thrust != 0
        {
        get_entity[? "speed"] = get_thrust*5
        }
    if get_brake != 0
        {
        get_entity[? "speed"] = -1
        }
    
    var get_x = get_entity[? "x"];
    var get_y = get_entity[? "y"];
    var get_direction = get_entity[? "direction"];
    var get_speed = get_entity[? "speed"];
    
    if get_thrust != 0
        {
        get_entity[? "x"] += lengthdir_x(get_speed,get_direction)
        get_entity[? "y"] += lengthdir_y(get_speed,get_direction)
        }
    }
