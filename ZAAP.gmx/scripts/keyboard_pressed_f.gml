///keyboard_pressed_f()

if not keyboard_check_pressed(ord('F'))
or keyboard_focus == "console"
exit

if am_client()
    {
    var get_ship = my_ship()
    if is_zero(get_ship) exit
    
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
        var new_x = clamp(build_cell_x+1,0,grid_width-1)
        //var new_y = clamp(build_cell_y,0,grid_height-1)
        entity_issue_command(get_entity,"build cell x",new_x)
        exit
        }

    if get_ship != 0
        {
        var left = keyboard_check(ord('S'))
        if left
        entity_issue_command(get_ship,"steer",0)
        if not left
        entity_issue_command(get_ship,"steer",-1)
        }
    }
