if not keyboard_check_pressed(ord('S'))
exit

if am_client()
    {
    var get_socket_map = socket_map[? SSS]
    var get_uuid = get_socket_map[? "ship"]
    var get_ship = entity_map[? get_uuid]

    if get_ship != 0
        {
        console_add("moving ship")
        
        packet_write(packet.issue_command,"brake",-1)
        }
    }
