///packet_collect_item(packet_array)
//arg0 is the entity collecting
//arg1 is the item being collected

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        write_type(packet.collect_item)
        var get_uuid = get_packet_array[data.arg_0]
        var get_other_uuid = get_packet_array[data.arg_1]
        write(get_uuid)
        write(get_other_uuid)
        packet_send_all()
        break
        }
    //----------------//
    case "client read":
        {
        var get_uuid = read()
        var get_other_uuid = read()
        
        var get_entity = entity_from_uuid(get_uuid)
        var get_other_entity = entity_from_uuid(get_other_uuid)
        
        if is_zero(get_entity)
        or is_zero(get_other_entity)
            {
            show("one of these entities didnt exist")
            show("#packet_collect_item")
            break
            }
        
        //add this to it's inventory
        entity_inventory_add(get_entity,get_other_entity,1)
        //destroy the item
        entity_destroy_basic(get_other_uuid)
        
        //draw the effect
        draw_effect_beam(get_entity,get_other_entity)
        
        break
        }
    //----------------//
    case "client write":
        {
        write_type(packet.collect_item)
        var get_uuid = get_packet_array[data.arg_0]
        var get_other_uuid = get_packet_array[data.arg_1]
        write(get_uuid)
        write(get_other_uuid)
        packet_send_host()
        break
        }
    //----------------//
    case "server read":
        {
        var get_uuid = read()
        var get_other_uuid = read()
        var get_entity = entity_from_uuid(get_uuid)
        var get_other_entity = entity_from_uuid(get_other_uuid)
        
        if is_zero(get_entity)
        or is_zero(get_other_entity)
            {
            show("one of these entities didn't exist")
            show("#packet_collect_item")
            break
            }
        var get_other_type = ds_get(get_other_entity,"type")
        if get_other_type != entity.item
            {
            show("Error, this isn't an item!")
            show("There is no case for this yet!")
            show("#packet_collect_item")
            break
            }
        var get_item = ds_get(get_other_entity,"id")
        var get_quantity = 1
        
        //add this to it's inventory
        entity_inventory_add(get_entity,get_item,get_quantity)
        
        //destroy the item
        entity_destroy_basic(get_other_uuid)
        
        //packet_collect_item
        packet_write(packet.collect_item,get_uuid,get_other_uuid)
        break
        }
    //----------------//
    default:
        {
        show("Error, no mode defined!")
        show("in packet_template")
        break
        }
    //----------------//
    }
