if not keyboard_check_pressed(ord('W'))
exit

if am_client()
    {
    if true
        {
        console_add("moving ship")
        var get_map = ds_map_find_value(socket_map,SSS)
        var get_ship = get_map[? "ship"]
        var get_entity = entity_map[? get_ship]
        var get_y = get_entity[? "y"]
        
        packet_write(packet.entity_send,get_ship,"y",get_y-5)
        }
    }
