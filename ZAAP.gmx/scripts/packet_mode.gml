if game_server >= 0
    {
    if argument0 == "read"
        {
        
        return "server read"
        }
    if argument0 == "write"
    return "server write"
    }
if game_client >= 0
    {
    if argument0 == "read"
    return "client read"
    if argument0 == "write"
    return "client write"
    }
console_add("Error, no packet mode!")
