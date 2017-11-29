///entity_list(entity.type)
//return the id of the list
//for the supplied entity type

var get_type = argument0

var entity_type_map = get("entity type map")

var get_list = ds_get(entity_type_map,get_type)

return get_list
