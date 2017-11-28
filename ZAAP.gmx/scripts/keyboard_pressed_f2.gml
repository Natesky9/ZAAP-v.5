///keyboard_pressed_f2()

if not keyboard_check_pressed(vk_f2)
exit

if am_server()
or am_client()
    {
    show_debug_entity_list = not show_debug_entity_list
    console_add("toggled entity list")
    if show_debug_entity_list
        {
        var envar_list = get("key list")
        ds_list_sort(envar_list,true)
        }
    }
