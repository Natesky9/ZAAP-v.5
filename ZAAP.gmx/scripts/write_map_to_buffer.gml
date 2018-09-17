///write_map_to_buffer(map)
var get_map = argument0

var get_list = keys(get_map)
var get_list_size = ds_list_size(get_list)
write(get_list_size)

for (var i = 0;i < get_list_size;i++)
    {
    show("inventory i is: " + string(i))
    var get_key = ds_list_find_value(get_list,i)
    //write key to buffer
    write_key_to_buffer(get_map,get_key)
    show("writing map key: " + string(get_key))
    }
