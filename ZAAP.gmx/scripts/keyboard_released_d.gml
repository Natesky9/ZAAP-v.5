///keyboard_released_d()

if not keyboard_check_released(ord('D'))
or keyboard_focus == "console"
exit

if am_client()
    {
    var get_ship = my_ship()
    if is_zero(get_ship) exit

    if get_ship != 0
        {
        entity_issue_command(get_ship,"brake",0)
        }
    }

if am_server()
    {
    //loop through the entity types
    var get_entity_type = ds_get(envar,"selected type")
    var new_entity_type = (get_entity_type + entity.types - 1) mod (entity.types)
    ds_set(envar,"selected type",new_entity_type,key.value)
    
    //output the entity type and name
    var name = name_from_type(new_entity_type)
    console_add("entity name is now: " + name)
    }
