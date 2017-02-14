var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        //maybe add to sync just the command
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
        //
        var get_ship = get_ship_from_socket(get_socket)
        if is_zero(get_ship)
            {
            console_add("player tried to issue a command without a ship!")
            exit
            }

        ds_set(get_ship,get_command,get_value)
                    
        var get_uuid = uuid_from_entity(get_ship)
        packet_write(packet.entity_send,get_uuid,get_command,get_value)
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
