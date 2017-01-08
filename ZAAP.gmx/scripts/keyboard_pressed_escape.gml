if keyboard_check_pressed(vk_escape)
    {
    if am_client()
        {
        data_structure_clear_all()
        network_destroy(game_client)
        SSS = -1
        host_connection = -1
        game_client = -1
        }
    //game_end()
    }
