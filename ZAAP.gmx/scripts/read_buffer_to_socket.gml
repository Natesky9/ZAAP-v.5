///read_buffer_to_socket()
//reads a socket from the buffer
//creates a player from it
var get_list_size = read()

var get_map = create_socket()
show("adding socket")

repeat get_list_size
    {
    var get_key = read()
    var get_value = read()
    ds_set(get_map,get_key,get_value,key.value)
    show("added key: " + get_key)
    show("with value: " + string(get_value))
    }
var get_socket = get_map[? "socket"]
show("socket added: " + string(get_socket))
ds_set(sockets,get_socket,get_map,key.map)

console_add("Player [" + string(get_socket) + "] connected!")
