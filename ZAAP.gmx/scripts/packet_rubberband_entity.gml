///packet_rubberband_entity(packet_array)

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        write_type(packet.rubberband_entity)
        var get_uuid = get_packet_array[data.arg_0]
        var get_entity = entity_from_uuid(get_uuid)
        
        var get_x = ds_get(get_entity,"x");
        var get_y = ds_get(get_entity,"y");
        
        var get_direction = ds_get(get_entity,"direction")
        var get_speed = ds_get(get_entity,"speed")
        var get_heading = ds_get(get_entity,"heading")
        
        write(get_uuid)
        write(get_x)
        write(get_y)
        write(get_direction)
        write(get_speed)
        write(get_heading)
        
        packet_send_all()
        
        break
        }
    //----------------//
    case "client read":
        {
        var get_uuid = read()
        var get_x = read()
        var get_y = read()
        var get_direction = read()
        var get_speed = read()
        var get_heading = read()
        
        
        
        var magnitude = get_speed
        
        var get_entity = entity_from_uuid(get_uuid)
        if is_zero(get_entity)
        exit
        
        //sloppy code here
        var get_current_x = ds_get(get_entity,"x")
        var get_current_y = ds_get(get_entity,"y")
        var get_current_heading = ds_get(get_entity,"heading")
        
        var get_x2 = get_x + lengthdir_x(get_speed*magnitude,get_direction);
        var get_y2 = get_y + lengthdir_y(get_speed*magnitude,get_direction);
        
        var updated_direction = point_direction(get_current_x,get_current_y,get_x2,get_y2);
        var updated_speed = point_distance(get_current_x,get_current_y,get_x2,get_y2)/magnitude;
        
        var updated_heading = get_heading;
        
        get_entity[? "direction"] = updated_direction
        get_entity[? "speed"] = updated_speed
        get_entity[? "heading"] = updated_heading
        //end sloppy code
        
        break
        }
    //----------------//
    case "client write":
        {
        write_type(packet.null)
        break
        }
    //----------------//
    case "server read":
        {
        break
        }
    //----------------//
    default:
        {
        show("Error, no mode defined!")
        show("in packet_template")
        break
        }
    //----------------//
    }
