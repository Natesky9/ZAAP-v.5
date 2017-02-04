if not keyboard_check_pressed(vk_escape)
exit

if am_client()
    {
    packet_write(packet.remove_socket)
    data_structure_clear_all()
    network_destroy(game_client)
    SSS = -1
    host_connection = -1
    game_client = -1
    view_reset()
    }
