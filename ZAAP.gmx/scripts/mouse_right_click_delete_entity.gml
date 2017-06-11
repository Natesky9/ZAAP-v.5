///mouse_right_click_delete_entity
//

var get_uuid = entity_find_from_point(mouse_x,mouse_y,false)
    {
    if not is_zero(get_uuid)
        {
        //packet_entity_destroy
        packet_write(packet.entity_destroy,get_uuid)
        entity_destroy_basic(get_uuid)
        console_add("destroyed " + string(get_uuid))
        exit
        }
    }
