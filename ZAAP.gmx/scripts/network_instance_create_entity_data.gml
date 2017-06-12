///network_instance_create_entity_data()

//create the main list
entity_list = ds_create(ds_type_list)
ds_add(envar,"entity list",entity_list)

for (var i = 1; i < entity.types;i += 1)
    {
    //create the list
    var get_list = ds_create(ds_type_list)
    //add these lists to the entity list
    ds_list_add(entity_list,get_list)
    //map the entity lists to the entity_type
    ds_add(envar,i,get_list)
    }

//create the uuid map
entity_map = ds_create(ds_type_map)
ds_add(envar,"entity map",entity_map)

//create the prestep and poststep handling lists
entity_destroy_list = ds_create(ds_type_list)
entity_create_list = ds_create(ds_type_list)

//create the recursive gravity list
entity_gravity_list = ds_create(ds_type_list)
