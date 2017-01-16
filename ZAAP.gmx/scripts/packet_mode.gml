if argument0 == "read"
    {
    bin = ds_map_find_value(async_load,"buffer")
    seek(bin)
    }
if argument0 == "write"
    {
    seek(bout)
    }


if am_server()
    {
    if argument0 == "read"    
    return "server read"
    if argument0 == "write"
    return "server write"
    }
if am_client()
    {
    if argument0 == "read"
    return "client read"
    if argument0 == "write"
    return "client write"
    }
console_add("Error, no packet mode!")

//code by Natesky9
//"Du do do doooo do DUUUU"
