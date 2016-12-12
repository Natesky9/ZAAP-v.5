//get the packet type
//if reading, read the first byte
//if writing, use the first argument
var get_function = argument0
var get_packet_array = argument1

if get_function == "server read"
or get_function == "client read"
    {
    bin = ds_map_find_value(async_load,"buffer")
    var get_packet = buffer_read(bin,buffer_u8)
    return get_packet
    }
if get_function == "server write"
or get_function == "client write"
    {
    show(string(get_packet_array))
    var get_packet = get_packet_array[1]
    return get_packet
    }

console_add("Error, no packet type defined!")
return -1
