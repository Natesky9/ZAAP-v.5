///mouse_create()

//create an entity
if value_selected_entity_type == entity.null
exit

var get_uuid = entity_create_advanced(mouse_x,mouse_y,value_selected_entity_type)
var get_entity = entity_from_uuid(get_uuid)


switch value_selected_entity_type
    {
    case entity.ship:
        {
        var basic_grid = ds_create(ds_type_grid,9,9);
        basic_grid[# 4,4] = true
        var get_entity = entity_from_uuid(get_uuid)
        ds_set(get_entity,"grid",basic_grid)
        break
        }
    }

ds_set(get_entity,"direction",irandom(360))
ds_set(get_entity,"heading",irandom(360))

packet_write(packet.entity_create,get_uuid,mouse_x,mouse_y)
