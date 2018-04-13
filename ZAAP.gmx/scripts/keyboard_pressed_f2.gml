///keyboard_pressed_f2()

if not keyboard_check_pressed(vk_f2)
exit

if am_server()
or am_client()
    {
    show_entity_registry = not show_entity_registry
    console_add("toggled entity registry")
    }
