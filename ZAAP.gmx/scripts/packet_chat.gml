///packet_chat(packet_array)

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        write_type(packet.chat)
        var get_text = get_packet_array[data.arg_0]
        console_add(get_text)
        
        write(get_text)
        
        var bytes = 0
        var socket_count = ds_size(sockets)
        for (var i = 0;i < socket_count;i += 1)
            {
            var get_socket = ds_index(sockets,i);
            bytes += network_send_packet(get_socket,bout,buffer_tell(bout))
            }
        
        break
        }
        //----------------//
    case "client read":
        {
        var get_text = read()
        console_add(get_text)
        show("received: " + string(get_text))
        break
        }
    //----------------//
    case "client write":
        {
        write_type(packet.chat)
        var get_text = get_packet_array[data.arg_0]
        show("get text is : " + string(get_text))
        
        write(get_text)
        
        packet_send_host()
        
        break
        }
    //----------------//
    case "server read":
        {
        var get_text = read()
        console_add(get_text)
        show("text: " + string(get_text))
        
        //packet_chat
        packet_write(packet.chat,get_text)
        
        break
        }
    //----------------//
        default:
        {
        console_add("Error, no packet defined");break
        }
    }
//Talky bits
