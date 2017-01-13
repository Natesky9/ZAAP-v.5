if not keyboard_check_pressed(ord('W'))
exit

if am_client()
    {
    if ship
        {
        var get_ship = ds_map_find_value(ship,"sss")
        packet_write(packet.entity_command_forward,get_ship)
        }
    }
