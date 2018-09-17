///keyboard_pressed_s()

if not keyboard_check_pressed(ord('S'))
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
        var new_x = clamp(build_cell_x-1,0,grid_width-1)
        //var new_y = clamp(build_cell_y,0,grid_height-1)
        entity_issue_command(get_entity,"build cell x",new_x)
        exit
        }
    
    if get_ship != 0
        {
        var right = keyboard_check(ord('F'))
        if right
        entity_issue_command(get_ship,"steer",0)
        if not right
        entity_issue_command(get_ship,"steer",+1)
        }
    }
//
if am_server()
    {
    //get a random ship
    var get_map = fetch_entity_map(entity.ship)
    var get_list = keys(get_map)
    var key_count = ds_list_size(get_list)
    
    if not key_count
        {
        console_add("There must be at least two")
        exit
        }
    
    var random_number = irandom(get_size-1)
    var random_ship = ds_list_find_value(get_list,random_number)
    //spawn in enemies targeting a ship
    var random_x = irandom(1000)
    var random_y = irandom(1000)
    var random_angle = irandom(360)
    var new_grid = ds_create(data.dynamic,ds_type_grid,9,9)
    
    randomize_grid(new_grid)
    
    
    var get_uuid = entity_create_server(random_x,random_y,entity.ship)
    var get_entity = entity_from_uuid(get_uuid)
    ds_set(get_entity,"x",random_x,key.value)
    ds_set(get_entity,"y",random_y,key.value)
    ds_set(get_entity,"heading",random_angle,key.value)
    
    ds_set(get_entity,"grid",new_grid,key.grid)
    
    //set the target
    ds_set(get_entity,"target",random_ship,key.value)
    
    //packet_entity_create
    packet_write(packet.entity_create,get_uuid)
    }
