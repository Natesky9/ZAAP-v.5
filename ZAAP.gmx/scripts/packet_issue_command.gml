///packet_issue_command(packet_array)

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        //maybe add to sync just the command
        var get_entity = get_packet_array[data.arg_0]
        var get_key = get_packet_array[data.arg_1]
        var get_value = get_packet_array[data.arg_2]
        if is_zero(get_entity)
            {
            show("error, entity no longer exists!")
            exit
            }
        
        buffer_write(bout,buffer_u8,packet.issue_command)
        var get_uuid = uuid_from_entity(get_entity)
        if is_zero(get_uuid)
        exit
        
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
        
        read_buffer_to_key(get_entity)
        break
        }
    //----------------//
    case "client write":
        {
        buffer_write(bout,buffer_u8,packet.issue_command)
        
        var get_command = get_packet_array[data.arg_0]
        var get_value = get_packet_array[data.arg_1]
        
        write(get_command)
        
        write(get_value)
        
        packet_send_host()
        break
        }
    //----------------//
    case "server read":
        {
        var get_command = read()
        get_value = read()
        
        var get_socket = async_load[? "id"]
        //
        var get_ship = get_ship_from_socket(get_socket)
        if is_zero(get_ship)
            {
            console_add("player tried to issue a command without a ship!")
            exit
            }
        //pass this to the entity
        entity_issue_command(get_ship,get_command,get_value)
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
