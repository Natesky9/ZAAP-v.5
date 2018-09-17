///keyboard_pressed_space()

if not keyboard_check_pressed(vk_space)
or keyboard_focus == "console"
exit



if am_client()
    {
    var get_ship = my_ship()
    var get_uuid = uuid_from_entity(get_ship)
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
        //packet_grid_set
        packet_write(packet.grid_set,get_uuid,build_cell_x,build_cell_y,irandom(10))
        exit
        }
    entity_issue_command(get_ship,"trigger",true)
    }
