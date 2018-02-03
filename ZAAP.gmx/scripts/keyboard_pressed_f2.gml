///keyboard_pressed_f2()

if not keyboard_check_pressed(vk_f2)
exit

if am_server()
or am_client()
    {
    show_entity_registry = not show_entity_registry
    console_add("toggled entity registry")
    if show_entity_registry
        {
        //###//
        //is this right?
        var envar_list = get("key list")
        ds_list_sort(envar_list,true)
        }
    }
