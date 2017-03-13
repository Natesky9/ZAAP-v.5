if not keyboard_check_pressed(ord('C'))
exit
//add in case for console and game
if keyboard_check(vk_control)
and am_server()
    {
    if am_server()
        {
        if IP != -1
            {
            //copy ip
            if keyboard_check(vk_alt)
                {
                console_add("IP copied to clipboard")
                console_add("Be careful, as this is your public IP")
                clipboard_set_text(IP)
                exit
                }
            if keyboard_check(vk_shift)
                {
                console_add("Integer IP copied to clipboard")
                clipboard_set_text(string(int_IP))
                exit
                }
            console_add("Letter IP copied to clipboard")
            clipboard_set_text(letter_IP)
            exit
            }
        if IP == -1
            {
            console_add("Error, server not connected!")
            }
        }
    }
if am_client()
    {
    var get_uuid = get_ship_from_socket(SSS)
    if is_zero(get_uuid)
    exit
    
    var get_entity = entity_from_uuid(get_uuid)
    
    var is_docked = ds_get(get_entity,"docked")
    
    entity_issue_command(get_entity,"docked",not is_docked)
    console_add("manual test dock")
    }
