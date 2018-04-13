///keyboard_pressed_f3()

if not keyboard_check_pressed(vk_f3)
exit



show_debug_data_structures = !show_debug_data_structures
console_add("Toggled debug overlay")
if show_debug_data_structures
    {
    var envar_list = get("key list")
    ds_list_sort(envar_list,true)
    
    element_add(100,100,registry,"registry",ds_type_map)
    }
else
    {
    var elements = ds_get(registry,"elements")
    var element_count = ds_size(elements)
    for (var i = 0;i < element_count;i++)
        {
        var get_element = ds_index(elements,0)
        element_delete(get_element)
        }
    }
