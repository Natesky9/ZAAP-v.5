///mouse_create()

//create an entity
var get_entity_type = get("selected type")


switch get_entity_type
    {
    case entity.ship:
        {
        var get_uuid = entity_create_server(mouse_x,mouse_y,get_entity_type)
        var get_entity = entity_from_uuid(get_uuid)
        var basic_grid = ds_create(data.dynamic,ds_type_grid,9,9);
        basic_grid[# 4,4] = true
        var get_entity = entity_from_uuid(get_uuid)
        ds_set(get_entity,"grid",basic_grid)
        break
        }
    //
    case entity.item:
        {
        var get_uuid = entity_create_server(mouse_x,mouse_y,get_entity_type)
        var get_entity = entity_from_uuid(get_uuid)
        var get_id = irandom(item.types-1)+1
        ds_set(get_entity,"id",get_id)
        console_add("id is: " + string(get_id))
        break
        }
    //
    case entity.asteroid:
        {
        var get_uuid = entity_create_server(mouse_x,mouse_y,get_entity_type)
        var get_entity = entity_from_uuid(get_uuid)
        generate_random_asteroid(get_uuid,get_entity,8,8)//irandom_range(10,40),irandom_range(10,40))
        
        ds_set(get_entity,"heading",irandom(360))
        ds_set(get_entity,"direction",irandom(360))
        ds_set(get_entity,"speed",irandom(4))
        
        break
        }
    case entity.bullet:
        {
        var get_uuid = entity_create_server(mouse_x,mouse_y,get_entity_type)
        var get_entity = entity_from_uuid(get_uuid)
        
        ds_set(get_entity,"lifetime",60)
        ds_set(get_entity,"direction",irandom(360))
        ds_set(get_entity,"speed",6)
        
        console_add("created bullet")
        break
        }
    case entity.shipyard:
        {
        var get_uuid = entity_create_server(mouse_x,mouse_y,get_entity_type)
        var get_entity = entity_from_uuid(get_uuid)
        
        console_add("created shipyard")
        break
        }
    //
    default:
        {
        //nothing special
        show("you don't have a case for this!")
        return false
        }
    }


//packet_entity_create
packet_write(packet.entity_create,get_uuid)
return true
