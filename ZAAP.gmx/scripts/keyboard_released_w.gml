if not keyboard_check_released(ord('W'))
exit

if am_client()
    {
    var get_socket_map = socket_map[? SSS]
    var get_uuid = get_socket_map[? "ship"]
    var get_ship = entity_map[? get_uuid]

    if get_ship != 0
        {
        packet_write(packet.issue_command,"thrust",false)
        }
    }
