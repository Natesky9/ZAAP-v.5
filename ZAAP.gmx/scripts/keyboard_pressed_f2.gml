if not keyboard_check_pressed(vk_f2)
exit

if am_server()
    {
    draw_debug_entity_list = !draw_debug_entity_list
    console_add("toggled entity list")
    }
