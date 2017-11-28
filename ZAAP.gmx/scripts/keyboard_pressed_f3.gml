///keyboard_pressed_f3()

if not keyboard_check_pressed(vk_f3)
exit


if am_server()
or am_client()
    {
    show_debug_data_structures = !show_debug_data_structures
    console_add("Toggled debug overlay")
    if show_debug_data_structures
        {
        var envar_list = get("key list")
        ds_list_sort(envar_list,true)
        }
    }
