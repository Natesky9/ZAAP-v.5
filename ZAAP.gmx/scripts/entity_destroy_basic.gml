///entity_destroy_basic(uuid)

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
    effect_create_above(ef_spark,get_x,get_y,1,c_red)
    }
//end effect

ds_list_add(entity_destroy_list,get_uuid)
//Event_Entity_Destroy()
