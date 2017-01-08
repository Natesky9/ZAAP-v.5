if keyboard_check_pressed(vk_f4)
    {
    show_debug = !show_debug
    show_debug_overlay(show_debug)
    console_add("Toggled debug overlay")
    }
