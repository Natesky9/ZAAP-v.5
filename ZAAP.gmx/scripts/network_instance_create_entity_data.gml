///network_instance_create_entity_data()

//entity_type_map is the map of type -> map
var entity_type_map = ds_create(ds_type_map)
ds_add_key_list(entity_type_map)
set("entity type map",entity_type_map)

//entity_map is the map of uuid -> map
var entity_map = ds_create(ds_type_map)
ds_add_key_list(entity_type_map)
set("entity_map",entity_map)

for (var i = 1; i <= entity.types;i += 1)
    {
    //create the list
    var get_list = ds_create(ds_type_list)
    //add these lists to the entity list
    ds_set(entity_type_map,i,get_list)
    }


//create the prestep and poststep handling lists
entity_destroy_list = ds_create(ds_type_list)
entity_create_list = ds_create(ds_type_list)

//create the recursive gravity list
entity_gravity_list = ds_create(ds_type_list)
