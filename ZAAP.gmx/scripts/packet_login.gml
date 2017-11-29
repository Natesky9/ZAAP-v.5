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
                var username = get("username")
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
                client_disconnect()
                }
            default:
                {
                console_add("error, incorrect data in packet")
                client_disconnect()
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
        var get_socket = ds_map_find_value(async_load,"id")
        var username = read()
        console_add("username: " + username + " joined")
        
        //check if player is already logged in
        
        if playerdata_exists(username)
            {//returning player, load save
            console_add("returning player, loading save")
            var get_profile = playerdata_load(username)
            var get_ship = ds_get(get_profile,"ship")
            
            if ds_list_find_index(entity_list,get_ship) != -1
                {
                console_add("players ship exists!")
                }
            else
                {
                console_add("players ship does not exist")
                }
            
            break
            }
        else
            {//new player, create save
            console_add("new player, creating save")
            playerdata_create(username)
            
            var get_uuid = entity_create_server(100,100,entity.ship)
            //set the grid
            var basic_grid = ds_create(ds_type_grid,7,7);
            basic_grid[# 3,3] = true
            basic_grid[# 3,2] = 3
            basic_grid[# 2,3] = 4
            basic_grid[# 4,3] = 4
            var get_entity = entity_from_uuid(get_uuid)
            ds_set(get_entity,"grid",basic_grid)
            //end setting the grid
            
            
            //packet_entity_create
            packet_write(packet.entity_create,get_uuid)
            
            //packet_entity_command
            packet_write(packet.entity_command,get_socket,get_uuid)
            
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
