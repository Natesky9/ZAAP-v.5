///entity_from_uuid(uuid)

var get_uuid = argument0

if get_uuid == 0
    {
    show("can't get entity from uuid: uuid is 0")
    return 0
    }
var get_map = fetch_entity_map(entity.types)
var get_entity = ds_get(get_map,get_uuid)

if get_entity == 0
    {
    return false
    }
return get_entity
