if keyboard_check_pressed(ord('S'))
server_create()

if keyboard_check_pressed(ord('C'))
    {
    var ip = "127.0.0.1"
    var port = 5678
    if client_create()
    client_connect(ip,port)
    }
if keyboard_check_pressed(vk_escape)
    {
    game_end()
    }
if keyboard_check_pressed(vk_enter)
    {
    if keyboard_string != ""
    console_add(keyboard_string)
    packet_create(packet.chat,keyboard_string)
    
    keyboard_string = ""
    }
