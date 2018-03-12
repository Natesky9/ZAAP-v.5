///Event_Entity_Destroy()
//###//
//double check that this was done correctly
if not am_client()
and not am_server()
exit

//remove the destroyed entities
while ds_list_size(entity_destroy_list)
    {
    //get the uuid to disassociate
    var get_uuid = ds_list_find_value(entity_destroy_list,0)
    //show("destroying uuid: " + string(get_uuid))
    //get the entity to destroy
    var get_entity = entity_from_uuid(get_uuid)
    if is_zero(get_entity)
        {
        show("error, no entity!")
        ds_list_delete(entity_destroy_list,0)
        continue
        }
    
    //get the entity type
    var pos;
    var get_type = ds_get(get_entity,"type")
    //
    //get the list id
    var get_map = fetch_entity_map(get_type)
    //delete it from that list
    ds_delete(get_map,get_uuid)
    
    //get the global list
    var get_global_map = fetch_entity_map(entity.types)
    //find where in the global entity list
    ds_delete(get_global_map,get_uuid)
    
    

    
    var get_key_list = ds_get(get_entity,"key list")
    var keys = ds_list_size(get_key_list)

    for (var i = 0;i < keys;i += 1)
        {
        var get_key = ds_list_find_value(get_key_list,i)
        ds_map_delete_key(get_entity,get_key)
        }
    
    //destroy the map
    ds_destroy(ds_type_map,get_entity)
    
    //we're done here
    ds_list_delete(entity_destroy_list,0)
    }
