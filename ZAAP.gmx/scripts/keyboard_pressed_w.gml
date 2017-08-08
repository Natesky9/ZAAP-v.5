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
    //loop through the entity types
    var get_entity_type = ds_get(envar,"selected entity type")
    var new_entity_type = (get_entity_type + 1) mod (entity.types)
    ds_set(envar,"selected entity type",(get_entity_type + 1) mod (entity.types))
    
    //output the entity type and name
    var name = name_from_type(new_entity_type)
    console_add("entity name is now: " + name)
    }
