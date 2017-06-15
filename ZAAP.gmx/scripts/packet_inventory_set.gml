///packet_template(packet_array)

var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        buffer_write(bout,buffer_u8,packet.inventory_set)
        var get_uuid = get_packet_array[data.arg_0]
        var get_item = get_packet_array[data.arg_1]
        var get_quantity = get_packet_array[data.arg_2]
        
        var uuid_buffer_type = key_to_buffer_type("uuid")
        buffer_write(bout,uuid_buffer_type,get_uuid)
        
        var item_buffer_type = key_to_buffer_type("id")
        buffer_write(bout,item_buffer_type,get_item)
        
        var quantity_buffer_type = key_to_buffer_type("quantity")
        buffer_write(bout,quantity_buffer_type,get_quantity)
        packet_send_all()
        break
        }
    //----------------//
    case "client read":
        {
        var uuid_buffer_type = key_to_buffer_type("uuid")
        var get_uuid = buffer_read(bin,uuid_buffer_type)
        
        show("uuid is: " + string(get_uuid))
        
        var item_buffer_type = key_to_buffer_type("id")
        var get_item = buffer_read(bin,item_buffer_type)
        
        var quantity_buffer_type = key_to_buffer_type("quantity")
        var get_quantity = buffer_read(bin,quantity_buffer_type)
        
        var get_entity = entity_from_uuid(get_uuid)
        if is_zero(get_entity)
            {
            show("error, entity not valid in packet_inventory_set")
            exit
            }
        ds_set(get_entity,get_item,get_quantity)
        
        //effect bits
        var get_x = ds_get(get_entity,"x")
        var get_y = ds_get(get_entity,"y")
        effect_create_above(ef_flare,get_x,get_y,0,c_aqua)
        break
        }
    //----------------//
    case "client write":
        {
        //this should not trigger, right?
        buffer_write(bout,buffer_u8,packet.inventory_set)
        break
        }
    //----------------//
    case "server read":
        {
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
