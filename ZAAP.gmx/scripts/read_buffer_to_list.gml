///read_buffer_to_list(list)
//populates a list from the buffer
var get_list = argument0

var get_list_size = read()

var get_value
for (var i = 0;i < get_list_size;i += 1)
    {
    get_value = read()
    ds_list_add(get_list,get_value)
    }
