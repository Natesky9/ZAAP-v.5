///Event_Entity_Create()


if not am_client()
and not am_server()
exit

//add the created entities
while ds_list_size(entity_create_list)
    {
    show("--Begin #Event_Entity_Create")
    //get the uuid to create
    var get_uuid = ds_list_find_value(entity_create_list,0)
    show("creating uuid: " + string(get_uuid))
    //get the entity
    var get_entity = entity_from_uuid(get_uuid)
    
    //find the entity type
    var get_type = ds_get(get_entity,"type")
    

    //add to global list
    //removed in favor of having the global map
    //be the part to include uninitialized entities
    
    //add to specific list
    var get_specific_map = fetch_entity_map(get_type)
    ds_set(get_specific_map,get_uuid,get_entity,key.map)
    
    //we're finished adding it
    ds_list_delete(entity_create_list,0)
    show("--End #Event_Entity_Create")
    }

