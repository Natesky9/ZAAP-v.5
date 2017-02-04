///read_buffer_to_uuid(get_uuid)

//create the entity
get_entity = create_entity()

//find out how many keys are to be read
var get_list_size = buffer_read(bin,buffer_u8)

repeat get_list_size
    {
    read_buffer_to_key(get_entity)
    }

//finish up by mapping uuid to entity
var get_uuid = ds_get(get_entity,"uuid")

if is_zero(get_uuid)
    {
    show("Error, received entity had no uuid")
    exit
    }
ds_map_add(entity_map,get_uuid,get_entity)
ds_list_add(entity_list,get_uuid)
show("created entity with uuid of [" + string(get_uuid) + "]")
//we're done here
