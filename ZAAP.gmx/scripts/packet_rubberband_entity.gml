///packet_rubberband_entity(packet_array)

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        buffer_write(bout,buffer_u8,packet.rubberband_entity)
        var get_uuid = get_packet_array[data.arg_0]
        var get_entity = entity_from_uuid(get_uuid)
        
        var get_x = ds_get(get_entity,"x");
        var get_y = ds_get(get_entity,"y");
        
        var get_direction = ds_get(get_entity,"direction")
        var get_speed = ds_get(get_entity,"speed")
        var get_heading = ds_get(get_entity,"heading")
    
        var uuid_buffer_type = key_to_buffer_type("uuid")
        var coordinate_buffer_type = key_to_buffer_type("x")
        var direction_buffer_type = key_to_buffer_type("direction")
        var speed_buffer_type = key_to_buffer_type("speed")
        var heading_buffer_type = key_to_buffer_type("heading")
        
        buffer_write(bout,uuid_buffer_type,get_uuid)
        buffer_write(bout,coordinate_buffer_type,get_x)
        buffer_write(bout,coordinate_buffer_type,get_y)
        buffer_write(bout,direction_buffer_type,get_direction)
        buffer_write(bout,speed_buffer_type,get_speed)
        buffer_write(bout,heading_buffer_type,get_heading)
        
        packet_send_all()
        
        break
        }
    //----------------//
    case "client read":
        {
        var uuid_buffer_type = key_to_buffer_type("uuid")
        var coordinate_buffer_type = key_to_buffer_type("x")
        var direction_buffer_type = key_to_buffer_type("direction")
        var speed_buffer_type = key_to_buffer_type("speed")
        var heading_buffer_type = key_to_buffer_type("heading")
        
        var get_uuid = buffer_read(bin,uuid_buffer_type)
        var get_x = buffer_read(bin,coordinate_buffer_type)
        var get_y = buffer_read(bin,coordinate_buffer_type)
        var get_direction = buffer_read(bin,direction_buffer_type)
        var get_speed = buffer_read(bin,speed_buffer_type)
        var get_heading = buffer_read(bin,heading_buffer_type)
        
        var magnitude = 15
        
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
        buffer_write(bout,buffer_u8,packet.null)
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
