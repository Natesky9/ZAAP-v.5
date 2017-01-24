var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        buffer_write(bout,buffer_u8,packet.null)
        break
        }
    //----------------//
    case "client read":
        {
        break
        }
    //----------------//
    case "client write":
        {
        buffer_write(bout,buffer_u8,packet.issue_command)
        
        var get_command = get_packet_array[data.arg_0]
        var get_value = get_packet_array[data.arg_1]
        
        buffer_write(bout,buffer_string,get_command)
        var get_command_buffer_type = key_to_buffer_type(get_command)
        buffer_write(bout,get_command_buffer_type,get_value)
        
        packet_send_host()
        break
        }
    //----------------//
    case "server read":
        {
        var get_command = buffer_read(bin,buffer_string)
        var get_command_buffer_type = key_to_buffer_type(get_command)
        var get_value = buffer_read(bin,get_command_buffer_type)
        
        var get_socket = async_load[? "id"]
        var get_socket_map = socket_map[? get_socket]
        
        var get_uuid = get_socket_map[? "ship"]
        
        if get_uuid == 0
            {
            show("player tried to issue a command without a ship!")
            exit
            }
        show("command is [" + get_command + "]")
        show("value is [" + string(get_value) + "]")
        
        var get_entity = entity_from_uuid(get_uuid);
        get_entity[? get_command] = get_value
        
        packet_write(packet.entity_send,get_uuid)
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
