var get_uuid = argument0

var get_entity = entity_from_uuid(get_uuid)
var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")
var get_type = ds_get(get_entity,"type")

//effect when deleted
if get_type == entity.ship
    {
    effect_create_above(ef_star,get_x,get_y,2,c_yellow)
    }
if get_type == entity.bullet
    {
    effect_create_above(ef_explosion,get_x,get_y,2,c_red)
    }
//end effect

var get_key_list = ds_get(get_entity,"key list")

if not is_zero(get_key_list)
    {
    //if it has a key list
    for (var i = 0;i < ds_list_size(get_key_list);i += 1)
        {
        var get_key = ds_list_find_value(get_key_list,i)
        ds_map_delete_key(get_entity,get_key)
        }
    
    ds_destroy(ds_type_list,get_key_list)
    //
    }
if is_zero(get_key_list)
console_add("deleted object does not have a key list")

//clear it from the list
var pos = ds_list_find_index(entity_list,get_uuid)
ds_list_delete(entity_list,pos)

//clear it from the entity map
ds_map_delete(entity_map,get_uuid)

ds_destroy(ds_type_map,get_entity)

