///packet_type(packet_array)
//get the packet type

//if reading, read the first byte
//if writing, use the first argument
var get_packet_array = argument0
var get_function = get_packet_array[data.mode]

//show("get_function is now " + string(get_function))

if get_function == "server read"
or get_function == "client read"
    {
    var get_packet = read_type()
    return get_packet
    }
if get_function == "server write"
or get_function == "client write"
    {
    //show(string(get_packet_array))
    var get_packet = get_packet_array[data.type]
    return get_packet
    }
console_add("Error, no packet type defined!")
show("Error, no packet type defined!")
return -1

//code by Natesky9
//"Fire in the hole!"
