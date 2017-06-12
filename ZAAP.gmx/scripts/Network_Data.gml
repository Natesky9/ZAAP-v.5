///Network_Data(packet_array)

//get_packet_array is the filled out packet
get_packet_array = argument[0]
//show("Packet [" + string(get_packet_array) + "]")

//seek to the begining of the packet
//seek(bin)

//get the packet type
var get_packet = packet_type(get_packet_array)
//show("//")
//show("packet type is: " + string(get_packet))
//show("//")
switch get_packet
    {
    //----------------//
    case packet.inform_sss:
        {packet_inform_sss(get_packet_array);break}
    //----------------//
    case packet.add_socket:
        {packet_add_socket(get_packet_array);break}
    //----------------//
    case packet.entity_command:
        {packet_entity_command(get_packet_array);break}
    //----------------//
    case packet.entity_damage:
        {packet_entity_damage(get_packet_array);break}
    //----------------//
    case packet.entity_set_pilot:
        {packet_entity_set_pilot(get_packet_array);break}
    //----------------//
    case packet.fire_weapon:
        {packet_fire_weapon(get_packet_array);break}
    //----------------//
    case packet.issue_command:
        {packet_issue_command(get_packet_array);break}
    //----------------//
    case packet.inventory_set:
        {packet_inventory_set(get_packet_array);break}
    //----------------//
    case packet.rubberband_entity:
        {packet_rubberband_entity(get_packet_array);break}
    //----------------//
    case packet.remove_socket:
        {packet_remove_socket(get_packet_array);break}
    //----------------//
    case packet.update_sockets:
        {packet_update_sockets(get_packet_array);break}
    //----------------//
    case packet.update_entities:
        {packet_update_entities(get_packet_array);break}
    //----------------//
    case packet.chat:
        {packet_chat(get_packet_array);break}
    //----------------//
    case packet.entity_create:
        {packet_entity_create(get_packet_array);break}
    //----------------//
    case packet.entity_destroy:
        {packet_entity_destroy(get_packet_array);break}
    //----------------//
    case packet.grid_set:
        {packet_grid_set(get_packet_array);break}
    //----------------//
    case packet.ping:
        {packet_ping(get_packet_array);break}
    //----------------//
    case packet.ping_report:
        {packet_ping_report(get_packet_array);break}
    //----------------//
    default:
        {console_add("Error, no packet defined");break}
    //----------------//
    }

//code by Natesky9
//"I've got you in my sights!"
