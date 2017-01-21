var get_entity = argument0

if !ds_exists(get_entity,ds_type_map)
    {
    show("entity is not mapped")
    return undefined
    }

var get_uuid = get_entity[? "uuid"]

if get_uuid == undefined
    {
    show("entity did not have uuid in key")
    return undefined
    }

return get_uuid
