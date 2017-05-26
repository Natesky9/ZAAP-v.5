///entity_find_nearest(type,x,y,blacklist)

var get_search_type = argument0
var get_search_x = argument1
var get_search_y = argument2
var blacklist = argument3

var nearest_entity = 0
var nearest_distance = -1

for (var i = 0;i < ds_list_size(entity_list);i += 1)
    {
    //change this to use the new entity list format
    //instead of the old one
    var get_uuid = ds_list_find_value(entity_list,i)
    
    if get_uuid == blacklist
    continue
    
    var get_entity = ds_get(entity_map,get_uuid)
    if is_zero(get_entity) exit
    
    var get_type = ds_get(get_entity,"type")
    if get_type != get_search_type
    continue
    
    var get_x = ds_get(get_entity,"x")
    var get_y = ds_get(get_entity,"y")
    
    var get_distance = point_distance(get_search_x,get_search_y,get_x,get_y)
    
    if nearest_distance == -1
    or get_distance < nearest_distance
        {
        nearest_entity = get_entity
        nearest_distance = get_distance
        }
    }
return nearest_entity
