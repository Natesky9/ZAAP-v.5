//this gets called on both client and server
//to create an entity and fill in it's information

//create the map value for the entity
var get_entity = ds_create(ds_type_map)

//create the key list to store it's lists
var key_list = ds_create(ds_type_list)
ds_map_add(get_entity,"key list",key_list)

//create the attribute list to store attributes
//var attribute_list = ds_create(ds_type_list)


//entity_add_new_key(get_entity,"attribute list",attribute_list)

//we're done here
return get_entity

//CHANGED
