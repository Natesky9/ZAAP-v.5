///keyboard_pressed_i()


if not keyboard_check_pressed(ord('I'))
or keyboard_focus == "console"
exit

if am_client()
    {
    show("keyboard i event")
    var get_ship = my_ship()
    show("my ship is: " + string(get_ship))
    if is_zero(get_ship) exit
    
    //not needed?
    var get_uuid = uuid_from_entity(get_ship)
    show("my uuid is: " + string(get_uuid))
    if is_zero(get_uuid) exit
    
    var get_inventory = ds_get(get_ship,"inventory")
    show("my inventory is: " + string(get_inventory))
    console_add("inventory is: " + string(get_inventory))
    if is_zero(get_inventory) exit
    
    element_add(500,400,element.inventory,"inventory",get_inventory)
    
    }
    
if am_server()
    {

    }
