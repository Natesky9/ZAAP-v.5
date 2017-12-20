///mouse_create()

//create an entity
var get_entity_type = get("selected entity type")
if get_entity_type == entity.null
exit


switch get_entity_type
    {
    case entity.ship:
        {
        var get_uuid = entity_create_server(mouse_x,mouse_y,get_entity_type)
        var get_entity = entity_from_uuid(get_uuid)
        var basic_grid = ds_create(ds_type_grid,9,9);
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
        generate_random_asteroid(get_entity,irandom_range(3,10),irandom_range(3,10))
        //ds_set(get_entity,"heading",irandom(360))
        break
        }
    //
    default:
        {
        //nothing special
        ds_set(get_entity,"direction",irandom(360))
        ds_set(get_entity,"heading",irandom(360))
        break
        }
    }


//packet_entity_create
packet_write(packet.entity_create,get_uuid)
