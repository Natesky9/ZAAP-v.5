var get_packet_array = argument0

var get_mode = get_packet_array[0]
show("mode is: " + string(get_mode))
show(string(get_packet_array))

switch get_mode
    {
    case "server read":
        {
        var get_text = buffer_read(bin,buffer_string)
        console_add(get_text)
        break
        }
    case "server write":
        {
        var get_text = get_packet_array[2]
        buffer_seek(bout,buffer_seek_start,0)
        buffer_write(bout,buffer_u8,packet.chat)
        buffer_write(bout,buffer_string,get_text)
        var bytes = 0
        for (var i = 0;i < ds_list_size(socket_list);i += 1)
            {
            var get_socket = ds_list_find_value(socket_list,i);
            bytes += network_send_packet(get_socket,bout,buffer_tell(bout))
            }
        
        console_add(string(bytes) + " bytes sent")
        break
        }
    case "client read":
        {
        var get_text = buffer_read(bin,buffer_string)
        console_add(get_text)
        break
        }
    case "client write":
        {
        var get_text = get_packet_array[2]
        buffer_seek(bout,buffer_seek_start,0)
        buffer_write(bout,buffer_u8,packet.chat)
        buffer_write(bout,buffer_string,get_text)
        var bytes = network_send_packet(host_connection,bout,buffer_tell(bout))
        console_add(string(bytes) + " bytes sent")
        break
        }
    }
