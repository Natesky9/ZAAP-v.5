///entity_map_uuid(entity)
//maps the entity to the uuid
var get_entity = argument0

var get_uuid = ds_get(get_entity,"uuid")

if is_zero(get_uuid)
    {
    show("Error, received entity had no uuid")
    exit
    }
ds_map_add(entity_map,get_uuid,get_entity)

//add to the create list
ds_list_add(entity_create_list,get_uuid)
