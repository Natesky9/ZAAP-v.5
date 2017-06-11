///keyboard_pressed_escape()

if not keyboard_check_pressed(vk_escape)
exit

if am_client()
    {
    //packet_remove_socket
    packet_write(packet.remove_socket)
    data_structure_clear_all()
    var get_client = ds_get(envar,"client")
    network_destroy(get_client)
    ds_set(envar,"client",-1)
    SSS = -1
    host_connection = -1
    view_reset()
    }
