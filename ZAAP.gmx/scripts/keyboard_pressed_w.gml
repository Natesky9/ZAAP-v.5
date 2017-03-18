///keyboard_pressed_w()

if not keyboard_check_pressed(ord('W'))
or keyboard_focus == "console"
exit

if am_client()
    {
    var get_ship = get_ship_from_socket(SSS)
    if is_zero(get_ship)
        {
        console_add("You don't have a ship! Press Control to make one")
        exit
        }
    var brake = keyboard_check(ord('S'))
    if brake
    entity_issue_command(get_ship,"brake",false)
    
    entity_issue_command(get_ship,"thrust",true)
    }

if am_server()
    {
    value_selected_entity_type = (value_selected_entity_type + 1)
                                mod (entity.types)
    //output the entity type and name
    console_add("entity type is now: " + string(value_selected_entity_type))
    show("entity type is now: " + string(value_selected_entity_type))
    var name = localized_entity_name[? value_selected_entity_type]
    console_add("entity name is now: " + name)
    }
