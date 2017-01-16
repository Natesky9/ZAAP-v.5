if not keyboard_check_pressed(ord('C'))
exit

if keyboard_check(vk_control)
    {
    if am_server()
        {
        if IP != -1
            {
            //copy ip
            clipboard_set_text(letter_IP)
            if keyboard_check(vk_shift)
            clipboard_set_text(IP)
            if keyboard_check(vk_alt)
            clipboard_set_text(string(int_IP))
            }
        if IP == -1
            {
            console_add("Error, server not connected!")
            }
        }
    }
