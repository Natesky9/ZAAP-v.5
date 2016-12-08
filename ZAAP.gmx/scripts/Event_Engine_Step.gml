if keyboard_check_pressed(ord('S'))
server_create()

if keyboard_check_pressed(ord('C'))
    {
    var ip = "127.0.0.1"
    var port = 5678
    if client_create()
    client_connect(ip,port)
    }
