if keyboard_check_pressed(ord('V'))
    {
    if keyboard_check(vk_control)
        {
        keyboard_string = clipboard_get_text()
        }
    }
