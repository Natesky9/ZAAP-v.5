///Event_Entity_Create()


if not am_client()
and not am_server()
exit

//add the created entities
while ds_list_size(entity_create_list)
    {
    //get the uuid to create
    var get_uuid = ds_list_find_value(entity_create_list,0)
    //find the entity type
    var get_type = ds_get(get_uuid,"type")
    
    //we're finished adding it
    ds_list_delete(entity_create_list,0)
    }

