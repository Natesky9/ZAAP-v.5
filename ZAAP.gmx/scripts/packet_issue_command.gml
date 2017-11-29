///packet_issue_command(packet_array)

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        write_type(packet.issue_command)
        //maybe add to sync just the command
        var get_uuid = get_packet_array[data.arg_0]
        var get_key = get_packet_array[data.arg_1]
        var get_value = get_packet_array[data.arg_2]
        
        
        write(get_uuid)
        
        write_key_to_buffer(get_key,get_value)
        packet_send_all()
        break
        }
    //----------------//
    case "client read":
        {
        get_uuid = read()
        //show("uuid is: " + string(get_uuid))
        var get_entity = entity_from_uuid(get_uuid)
        
        if is_zero(get_entity)
            {
            show("entity does not exist #packet_issue_command")
            exit
            }
        
        read_buffer_to_key(get_entity)
        break
        }
    //----------------//
    case "client write":
        {
        write_type(packet.issue_command)
        
        var get_uuid = get_packet_array[data.arg_0]
        var get_command = get_packet_array[data.arg_1]
        var get_value = get_packet_array[data.arg_2]
        
        write(get_uuid)
        
        write(get_command)
        
        write(get_value)
        
        packet_send_host()
        break
        }
    //----------------//
    case "server read":
        {
        var get_uuid = read()
        var get_command = read()
        var get_value = read()
        
        var get_socket = async_load[? "id"]
        //
        var get_entity = entity_from_uuid(get_uuid)
        
        if is_zero(get_entity)
            {
            show("uuid is: " + string(get_uuid))
            show("error, entity did not exist #packet_issue_command server")
            //send a destroy packet to the client
            exit
            }
        
        //pass this to the entity
        entity_issue_command(get_entity,get_command,get_value)
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
