///keyboard_pressed_enter()

if not keyboard_check_pressed(vk_enter)
exit

if keyboard_focus != "console"
    {
    keyboard_focus = "console"
    keyboard_string = ""
    exit
    }


if am_server()
or am_client()
    {
    //console_add(keyboard_string)
    //packet_chat
    packet_write(packet.chat,keyboard_string)
    keyboard_focus = "game"
    keyboard_string = ""
    }

    
//client creation
if not am_server()
and not am_client()
    {
    var ip = find_ip()
    if ip != -1
        {
        var port = 5678
        var client_created = client_create()
        if client_created
            {
            var client_connected = client_connect(ip,port)
            
            if client_connected == -1
                {
                console_add("Client not connected")
                show("Client: " + string(client_connected))
                client_destroy()
                }
            }
        if !client_created
            {
            console_add("Error, client failed to create")
            }
        }
    keyboard_string = ""
    keyboard_focus = "game"
    }
//end client creation

