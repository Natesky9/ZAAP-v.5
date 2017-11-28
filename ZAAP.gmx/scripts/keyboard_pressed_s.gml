///keyboard_pressed_s()

if not keyboard_check_pressed(ord('S'))
or keyboard_focus == "console"
exit

if am_client()
    {
    var get_ship = get_ship_from_socket(get("SSS"))
    if is_zero(get_ship) exit

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
    var get_list = entity_list(entity.ship)
    var get_size = ds_list_size(get_list)
    
    if not get_size
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
    var new_grid = ds_create(ds_type_grid,9,9)
    
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
