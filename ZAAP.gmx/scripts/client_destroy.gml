///client_destroy()

var get_client = ds_get(envar,"client")
network_destroy(get_client)
//reset stored variables
ds_set(envar,"client",-1)
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
    var get_list = ds_list_find_value(entity_list,i)
    for (var ii = 0;ii < ds_list_size(get_list);ii += 1)
        {
        var get_entity = ds_list_find_value(get_list,ii)
        ds_map_destroy(get_entity)
        }
    ds_list_clear(get_list)
    }
ds_list_clear(entity_list)
ds_map_destroy(entity_map)

//add in other reset scripts here
