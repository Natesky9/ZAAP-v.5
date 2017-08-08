///keyboard_released_s()

if not keyboard_check_released(ord('S'))
or keyboard_focus == "console"
exit

if am_client()
    {
    var get_ship = get_ship_from_socket(SSS)
    if is_zero(get_ship) exit

    if get_ship != 0
        {
        entity_issue_command(get_ship,"brake",0)
        }
    }

if am_server()
    {
    //loop through the entity types
    var get_entity_type = ds_get(envar,"selected entity type")
    var new_entity_type = (get_entity_type + entity.types - 1) mod (entity.types)
    ds_set(envar,"selected entity type",new_entity_type)
    
    //output the entity type and name
    var name = name_from_type(new_entity_type)
    console_add("entity name is now: " + name)
    }
