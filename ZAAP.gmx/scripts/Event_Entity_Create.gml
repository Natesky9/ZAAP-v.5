///Event_Entity_Create()


if not am_client()
and not am_server()
exit
//###//
//double check this was done correctly
//pretty sure this works

//add the created entities
while ds_list_size(entity_create_list)
    {
    //get the uuid to create
    var get_uuid = ds_list_find_value(entity_create_list,0)
    //get the entity
    var get_entity = entity_from_uuid(get_uuid)
    //find the entity type
    var get_type = ds_get(get_entity,"type")
    

    //add to global list
    var get_list = entity_list(entity.types)
    //add to specific list
    var get_specific_list = entity_list(get_type)
    
    ds_list_add(get_list,get_uuid)
    ds_list_add(get_specific_list,get_uuid)
    
    //show("created entity of type: " + string(get_type))
    //show("#adding to lists : " + string(get_list) + " , " + string(get_specific_list))
    
    //we're finished adding it
    ds_list_delete(entity_create_list,0)
    }

