if not keyboard_check_pressed(ord('C'))
exit

if keyboard_check(vk_control)
    {
    if am_server()
        {
        if IP != -1
            {
            //copy ip
            keyboard_string = letter_IP
            if keyboard_check(vk_shift)
            keyboard_string = IP
            if keyboard_check(vk_alt)
            keyboard_string = string(int_IP)
            }
        if IP == -1
            {
            console_add("Error, server not connected!")
            }
        }
    }
