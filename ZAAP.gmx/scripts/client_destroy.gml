///client_destroy()

network_destroy(game_client)
//reset stored variables
game_client = -1
SSS = -1

//clear the socket list
for (var i = 0;i < ds_list_size(socket_list);i += 1)
    {
    var get_socket = ds_list_find_value(socket_list,i)
    
    ds_map_destroy(get_socket)
    }
ds_list_clear(socket_list)

for (var i = 0;i < ds_list_size(entity_list);i += 1)
    {
    var get_entity = ds_list_find_value(entity_list,i)
    ds_map_destroy(get_entity)
    }
ds_list_clear(entity_list)
ds_map_destroy(entity_map)

//add in other reset scripts here
