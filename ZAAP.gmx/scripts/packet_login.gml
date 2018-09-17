///packet_template(packet_array)

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        write_type(packet.login)
        var socket = get_packet_array[data.arg_0]
        var type = get_packet_array[data.arg_1]
        
        
        write(type)
        
        packet_send(socket)
        
        break
        }
    //----------------//
    case "client read":
        {
        var type = read()
        
        switch type
            {
            case data.request:
                {
                var username = ds_get(envar,"username")
                packet_write(packet.login,username)
                break
                }
            case data.approve:
                {
                console_add("sucessfully connected!")
                break
                }
            case data.deny:
                {
                console_add("player already in server!")
                client_destroy()
                }
            default:
                {
                console_add("error, incorrect data in packet")
                client_destroy()
                break
                }
            }
        break
        }
    //----------------//
    case "client write":
        {
        write_type(packet.login)
        
        var username = get_packet_array[data.arg_0]
        write(username)
        packet_send_host()
        break
        }
    //----------------//
    case "server read":
        {
        show("GOT TO THIS POINT")
        var get_socket = ds_get(async_load,"id")
        var username = read()
        show("username: " + username + " joined")
        
        var get_player = map_from_socket(get_socket)
        console_add("get_player: " + string(get_player))
        ds_set(get_player,"username",username,key.text)
        
        //packet_add_socket
        packet_write(packet.add_socket,get_socket)
        //check if player is already logged in
        
        if false//playerdata_exists(username)
            {//returning player, load save
            console_add("returning player, loading save")
            var get_profile = playerdata_load(username)
            var get_ship = ds_get(get_profile,"ship")
            break
            }
        else
            {//new player, create save
            console_add("new player, creating save")
            playerdata_create(username)
            
            server_create_entity_player_ship(get_socket,200,200)
            break
            }
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
