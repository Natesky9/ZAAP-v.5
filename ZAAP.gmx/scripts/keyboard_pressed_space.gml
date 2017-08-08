///keyboard_pressed_space()

if not keyboard_check_pressed(vk_space)
or keyboard_focus == "console"
exit

//packet_fire_weapon
//packet_write(packet.fire_weapon)

if am_client()
    {
    var get_ship = get_ship_from_socket(SSS)
    if is_zero(get_ship) exit
    
    entity_issue_command(get_ship,"trigger",true)
    }
