///entity_find_nearest(type,x,y,blacklist)
//find the nearest entity of a specific type
//not including the blacklisted entity (change to list?)
//returns entity

var get_search_type = argument0
var get_search_x = argument1
var get_search_y = argument2
var blacklist = argument3

var nearest_entity = 0
var nearest_distance = -1

var get_map = fetch_entity_map(get_search_type)
var get_list = keys_from_map(get_map)
var keys = ds_list_size(get_list)
//show("size of list to search: " + string(keys))
if not keys
    {
    show("list is empty #entity_find_nearest")
    return false
    }

for (var i = 0;i < keys;i += 1)
    {
    var get_uuid = ds_list_find_value(get_list,i)
    
    if get_uuid == blacklist
    continue
    
    var get_entity = entity_from_uuid(get_uuid)
    if is_zero(get_entity) exit
    
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
