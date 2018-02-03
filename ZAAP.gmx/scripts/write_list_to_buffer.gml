///write_list_to_buffer(list)
//writes the list to buffer
var get_list = argument0

var get_list_size = ds_list_size(get_list)
write(get_list_size)

//show("writing keys to buffer")
var get_value
for (var i = 0;i < get_list_size;i += 1)
    {
    get_value = ds_list_find_value(get_list,i)
    write(get_value)
    }

