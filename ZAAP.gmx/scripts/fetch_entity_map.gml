///fetch_entity_map(entity.type)
//return the id of the list
//for the supplied entity type
//if no argument supplied
//return the map itself
var get_map = get("entity map")

if argument_count == 0
return get_map

var get_type = argument[0]

var get_list = ds_get(get_map,get_type)

return get_list
