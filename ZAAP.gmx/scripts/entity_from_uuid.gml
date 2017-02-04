//redundant version of ds_get

var get_uuid = argument0

if get_uuid == 0
    {
    show("can't get entity from uuid: uuid is 0")
    return 0
    }

var get_entity = ds_get(entity_map,get_uuid)

if get_entity == 0
    {
    console_add("Error, tried to get entity with uuid of [" + string(get_uuid) + "]")
    return false
    }
return get_entity
