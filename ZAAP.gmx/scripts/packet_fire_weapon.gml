var get_packet_array = argument0

switch get_packet_array[data.mode]
    {
    //----------------//
    case "server write":
        {
        buffer_write(bout,buffer_u8,packet.fire_weapon)
        var get_ship = get_packet_array[data.arg_0]
        var get_projectile = get_packet_array[data.arg_1]
        
        var uuid_buffer_type = key_to_buffer_type("uuid")
        buffer_write(bout,uuid_buffer_type,get_ship)
        buffer_write(bout,uuid_buffer_type,get_projectile)
        packet_send_all()
        break
        }
    //----------------//
    case "client read":
        {
        var uuid_buffer_type = key_to_buffer_type("uuid")
        var get_ship = buffer_read(bin,uuid_buffer_type)
        var get_projectile = buffer_read(bin,uuid_buffer_type)
        
        var get_entity = entity_from_uuid(get_ship)
        if is_zero(get_entity) exit
        
        var get_x = get_entity[? "x"]
        var get_y = get_entity[? "y"]
        var get_speed = get_entity[? "speed"]
        var get_direction = get_entity[? "direction"]
        var get_heading = get_entity[? "heading"]
        
        //
        var new_entity = entity_create_basic()
        ds_set(new_entity,"x",get_x)
        ds_set(new_entity,"y",get_y)
        ds_set(new_entity,"uuid",get_projectile)
        ds_set(new_entity,"type",entity.bullet)
        ds_set(new_entity,"speed",get_speed + 16)
        ds_set(new_entity,"direction",get_heading)
        ds_set(new_entity,"heading",get_heading)
        ds_set(new_entity,"source",get_ship)
        ds_set(new_entity,"lifetime",120)
        
        ds_set(entity_map,get_projectile,new_entity)
        ds_list_add(entity_list,get_projectile)
        //
        break
        }
    //----------------//
    case "client write":
        {
        buffer_write(bout,buffer_u8,packet.fire_weapon)
        //add in other arguments
        packet_send_host()
        break
        }
    //----------------//
    case "server read":
        {
        var get_socket = async_load[? "id"]
        var get_ship = get_ship_from_socket(get_socket)
        if is_zero(get_ship)
            {
            console_add("player tried to issue a command without a ship!")
            exit
            }
        
        var get_ship_uuid = uuid_from_entity(get_ship)
        var get_x = ds_get(get_ship,"x")
        var get_y = ds_get(get_ship,"y")
        var get_direction = ds_get(get_ship,"direction")
        var get_speed = ds_get(get_ship,"speed")
        var get_heading = ds_get(get_ship,"heading")
        //create the bullet
        var get_uuid = entity_create_advanced(get_x,get_y,entity.bullet)
        var get_entity = entity_from_uuid(get_uuid);
        ds_set(get_entity,"speed",get_speed + 10)
        ds_set(get_entity,"direction",get_heading)
        ds_set(get_entity,"heading",get_heading)
        ds_set(get_entity,"source",get_ship_uuid)
        ds_set(get_entity,"lifetime",60)
        
        packet_write(packet.fire_weapon,get_ship_uuid,get_uuid)
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
