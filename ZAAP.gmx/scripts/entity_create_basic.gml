///entity_create_basic()
//this gets called on both client and server
//returns entity

//create the map value for the entity
var get_entity = ds_create(ds_type_map)

//create the key list to store it's keys
var key_list = ds_create(ds_type_list);
get_entity[? "key list"] = key_list

//we're done here
return get_entity
