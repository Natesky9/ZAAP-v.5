///mouse_create()

//create an entity
var get_entity_type = ds_get(envar,"selected entity type")
if get_entity_type == entity.null
exit

var get_entity_type = ds_get(envar,"selected entity type")
var get_uuid = entity_create_advanced(mouse_x,mouse_y,get_entity_type)
var get_entity = entity_from_uuid(get_uuid)

switch get_entity_type
    {
    case entity.ship:
        {
        var basic_grid = ds_create(ds_type_grid,9,9);
        basic_grid[# 4,4] = true
        var get_entity = entity_from_uuid(get_uuid)
        ds_set(get_entity,"grid",basic_grid)
        break
        }
    //
    case entity.item:
        {
        var get_id = random_range(item.null+1,item.types-1)
        ds_set(get_entity,"id",get_id)
        console_add("id is: " + string(get_id))
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
packet_write(packet.entity_create,get_uuid,mouse_x,mouse_y)
