///Event_Entity_Destroy()

if not am_client()
and not am_server()
exit

//remove the destroyed entities
while ds_list_size(entity_destroy_list)
    {
    //get the uuid to destroy
    var get_uuid = ds_list_find_value(entity_destroy_list,0)
    //find where it is in the entity list
    var pos = ds_list_find_index(entity_list,get_uuid)
    //and free the uuid
    ds_list_delete(entity_list,pos)
    //we're finished removing it
    ds_list_delete(entity_destroy_list,0)
    }

