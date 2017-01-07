var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        var get_text = get_packet_array[data.arg_0]
        show("text: " + string(get_text))
        
        buffer_write(bout,buffer_u8,packet.chat)
        buffer_write(bout,buffer_string,get_text)
        
        var bytes = 0
        for (var i = 0;i < ds_list_size(socket_list);i += 1)
            {
            var get_socket = ds_list_find_value(socket_list,i);
            bytes += network_send_packet(get_socket,bout,buffer_tell(bout))
            }
        
        show(string(bytes) + " bytes sent")
        break
        }
        //----------------//
    case "client read":
        {
        var get_text = buffer_read(bin,buffer_string)
        console_add(get_text)
        show("received: " + string(get_text))
        break
        }
    //----------------//
    case "client write":
        {
        var get_text = get_packet_array[data.arg_0]
        show("get text is : " + string(get_text))
        
        buffer_write(bout,buffer_u8,packet.chat)
        buffer_write(bout,buffer_string,get_text)
        
        var bytes = network_send_packet(host_connection,bout,buffer_tell(bout))
        //console_add(string(bytes) + " bytes sent")
        show("Sent: " + string(bytes) + " bytes sent")
        //error case for packet not sent
        if bytes == -1
            {
            show("error, packet not sent")
            console_add("Packet not sent")
            console_add("Server has not responded")
            }
        
        break
        }
    //----------------//
    case "server read":
        {
        var get_text = buffer_read(bin,buffer_string)
        console_add(get_text)
        show("text: " + string(get_text))
        packet_write(packet.chat,get_text)
        break
        }
    //----------------//
    }
