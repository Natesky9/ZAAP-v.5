var get_uuid = argument0

var get_entity = ds_map_find_value(entity_map,get_uuid)

if get_entity == undefined
console_add("Error, tried to get entity with uuid of [" + string(get_uuid) + "]")

return get_entity
