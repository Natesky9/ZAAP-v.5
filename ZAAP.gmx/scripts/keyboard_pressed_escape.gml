///keyboard_pressed_escape()

if not keyboard_check_pressed(vk_escape)
exit

if am_client()
    {
    client_destroy()
    }
if am_server()
    {
    //server_destroy()
    show("No server destroy event yet!")
    }
