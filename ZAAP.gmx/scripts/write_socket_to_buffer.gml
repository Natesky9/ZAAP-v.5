///write_socket_to_buffer(socket)

var get_socket = argument0

var get_map = map_from_socket(get_socket)
if is_zero(get_map) exit
var key_list = keys(get_map);


var username = ds_get(get_map,"username")
show("username connecting is: " + username)
console_add("Username: " + username)
        

var get_list_size = ds_list_size(key_list)
//show("key list is this long: " + string(ds_list_size(key_list)))
write(get_list_size)

for (var i = 0;i < get_list_size;i += 1)
    {
    var get_key = ds_list_find_value(key_list,i)
    var get_value = ds_get(get_map,get_key)
    //show("key is: " + get_key)
    //show("value is: " + string(get_value))
    
    write(get_key)
    write(get_value)
    }

