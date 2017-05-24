///Event_Entity_Create()


if not am_client()
and not am_server()
exit
//###
//add the created entities
while ds_list_size(entity_create_list)
    {
    //get the uuid to create
    var get_uuid = ds_list_find_value(entity_create_list,0)
    //get the entity
    var get_entity = entity_from_uuid(get_uuid)
    //find the entity type
    var get_type = ds_get(get_entity,"type")
    
    //add into appropriate list
    var get_list = ds_get(envar,get_type)
    ds_list_add(get_list,get_uuid)
    
    show("created entity of type: " + string(get_type) +
    " added to entity list of id: " + string(get_list))
    
    //we're finished adding it
    ds_list_delete(entity_create_list,0)
    }

