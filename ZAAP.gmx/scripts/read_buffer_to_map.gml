///read_buffer_to_map(map)
//receives a map

var get_map = argument0
//find out how many keys are to be read
var get_list_size = read()

var i = 0
repeat get_list_size
    {
    show("inventory i is: " + string(i))
    i++
    read_buffer_to_key(get_map)
    }
