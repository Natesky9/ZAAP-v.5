steps_since_game_started += 1

Event_Keyboard()

Event_Mouse()    


if am_client()
    {
    if !(steps_since_game_started mod 30)
        {
        show("ping")
        packet_write(packet.ping)
        }
    }

if am_server()
    {
    if ds_list_size(socket_list)
    and !(steps_since_game_started mod 30)
        {
        show("return ping")
        packet_write(packet.ping_report)
        }
    }
