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
        var get_grid = grid_from_entity(get_ship)
        var grid_width = ds_grid_width(get_grid)
        var grid_height = ds_grid_height(get_grid)
        
        var get_entity = entity_from_uuid(docked)
        var build_cell_x = ds_get(get_entity,"build cell x")
        var build_cell_y = ds_get(get_entity,"build cell y")
        //var new_x = clamp(build_cell_x,0,grid_width-1)
        var new_y = clamp(build_cell_y-1,0,grid_height-1)
        entity_issue_command(get_entity,"build cell y",new_y)
        exit
        }
    
    var brake = keyboard_check(ord('D'))
    if brake
    entity_issue_command(get_ship,"brake",false)
    
    entity_issue_command(get_ship,"thrust",true)
    }

if am_server()
    {
    var get_uuid = ds_get(envar,"selected entity")
    
    if get_uuid
        {
        get_entity = entity_from_uuid(get_uuid)
        ds_add(get_entity,"y",-10)
        exit
        }
    
    //loop through the entity types
    var get_entity_type = ds_get(envar,"selected type")
    var new_entity_type = (get_entity_type + 1) mod (entity.types)
    ds_set(envar,"selected type",(get_entity_type + 1) mod (entity.types),key.value)
    
    //output the entity type and name
    var name = name_from_type(new_entity_type)
    console_add("entity name is now: " + name)
    }
