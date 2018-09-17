///keyboard_pressed_d()

if not keyboard_check_pressed(ord('D'))
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
        //var new_x = clamp(build_cell_x,0,grid_width-1)
        var new_y = clamp(build_cell_y+1,0,grid_height-1)
        entity_issue_command(get_entity,"build cell y",new_y)
        exit
        }
    
    if get_ship != 0
        {
        entity_issue_command(get_ship,"brake",1)
        }
    }
if am_server()
    {
    var get_uuid = entity_create_server(mouse_x,mouse_y,entity.item)
    var get_entity = entity_from_uuid(get_uuid)
    ds_set(get_entity,"speed",irandom(4),key.value)
    ds_set(get_entity,"direction",irandom(360),key.value)
    ds_set(get_entity,"heading",irandom(360),key.value)
    //packet_entity_create
    packet_write(packet.entity_create,get_uuid,mouse_x,mouse_y)
    }
