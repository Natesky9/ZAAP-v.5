///fetch_entity_map(entity.type)
//return the id of the list
//for the supplied entity type
//if no argument supplied
//return the map itself
var get_entity_map = ds_get(envar,"entity map")

if argument_count == 0
return get_entity_map

var get_type = argument[0]

var get_specific_map = ds_get(get_entity_map,get_type)

return get_specific_map
