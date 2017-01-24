var get_entity = argument0

if !ds_exists(get_entity,ds_type_map)
    {
    show("entity is not mapped")
    return 0
    }

var get_uuid = get_entity[? "uuid"]

if get_uuid == 0
    {
    show("entity did not have uuid in key")
    return 0
    }

return get_uuid
