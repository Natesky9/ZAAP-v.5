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
        var get_entity = entity_from_uuid(docked)
        var build_cell_x = ds_get(get_entity,"build cell x")
        var build_cell_y = ds_get(get_entity,"build cell y")
        entity_issue_command(get_entity,"build cell x",build_cell_x-1)
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
    var get_list = keys_from_map(get_map)
    var keys = ds_list_size(get_list)
    
    if not keys
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
    ds_set(get_entity,"x",random_x)
    ds_set(get_entity,"y",random_y)
    ds_set(get_entity,"heading",random_angle)
    
    ds_set(get_entity,"grid",new_grid)
    
    //set the target
    ds_set(get_entity,"target",random_ship)
    
    //packet_entity_create
    packet_write(packet.entity_create,get_uuid)
    }
