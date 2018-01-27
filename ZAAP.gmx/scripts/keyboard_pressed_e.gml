///keyboard_pressed_e()

if not keyboard_check_pressed(ord('E'))
or keyboard_focus == "console"
exit

if am_client()
    {
    var get_ship = get_ship_from_socket(get("SSS"))
    if is_zero(get_ship)
        {
        console_add("You don't have a ship! Press Control to make one")
        exit
        }
    
    if entity_is_docked(get_ship)
        {
        show("docked entity pressed left up")
        exit
        }
    
    var brake = keyboard_check(ord('D'))
    if brake
    entity_issue_command(get_ship,"brake",false)
    
    entity_issue_command(get_ship,"thrust",true)
    }

if am_server()
    {
    var get_uuid = get("selected entity")
    
    if get_uuid
        {
        get_entity = entity_from_uuid(get_uuid)
        ds_add(get_entity,"y",-10)
        exit
        }
    
    //loop through the entity types
    var get_entity_type = get("selected entity type")
    var new_entity_type = (get_entity_type + 1) mod (entity.types)
    set("selected entity type",(get_entity_type + 1) mod (entity.types))
    
    //output the entity type and name
    var name = name_from_type(new_entity_type)
    console_add("entity name is now: " + name)
    }
