if not keyboard_check_released(ord('A'))
exit

if am_client()
    {
    var get_socket_map = socket_map[? SSS]
    var get_uuid = get_socket_map[? "ship"]
    var get_ship = entity_map[? get_uuid]

    if get_ship != 0
        {
        var right = keyboard_check(ord('D'))
        if right
        packet_write(packet.issue_command,"steer",-1)
        if not right
        packet_write(packet.issue_command,"steer",0)
        }
    }
