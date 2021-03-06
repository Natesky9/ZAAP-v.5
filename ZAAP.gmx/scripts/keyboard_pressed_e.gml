///keyboard_pressed_e()

if not keyboard_check_pressed(ord('E'))
or keyboard_focus == "console"
exit

if am_client()
    {
    var get_ship = my_ship()
    if is_zero(get_ship)
        {
        console_add("You don't have a ship! Press Control to make one")
        exit
        }
    var docked = entity_is_docked(get_ship)
    if docked
        {
        show("docked entity pressed left up")
        var get_entity = entity_from_uuid(docked)
        var build_cell_x = ds_get(get_entity,"build cell x")
        var build_cell_y = ds_get(get_entity,"build cell y")
        entity_issue_command(get_entity,"build cell y",build_cell_y-1)
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
    var get_entity_type = get("selected type")
    var new_entity_type = (get_entity_type + 1) mod (entity.types)
    set("selected type",(get_entity_type + 1) mod (entity.types))
    
    //output the entity type and name
    var name = name_from_type(new_entity_type)
    console_add("entity name is now: " + name)
    }
