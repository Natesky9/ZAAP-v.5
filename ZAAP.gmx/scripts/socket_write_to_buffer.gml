///socket_write_to_buffer(socket)

var get_socket = argument0

var get_map = map_from_socket(get_socket)
if is_zero(get_map) exit
var key_list = get_map[? "key list"];

var get_list_size = ds_list_size(key_list)
show("key list is this long: " + string(ds_list_size(key_list)))
buffer_write(bout,buffer_u8,get_list_size)

for (var i = 0;i < get_list_size;i += 1)
    {
    var get_key = ds_list_find_value(key_list,i)
    show("key is: " + get_key)
    var get_buffer_type = key_to_buffer_type(get_key)
    var get_value = ds_map_find_value(get_map,get_key)
    show("value is: " + string(get_value))
    
    buffer_write(bout,buffer_string,get_key)
    buffer_write(bout,get_buffer_type,get_value)
    }

