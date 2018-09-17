///initialize_entity_map()
//start defining the static entity map

//entity_map is the map of type -> map
var entity_map = ds_create(data.permanent,ds_type_map)
ds_set(envar,"entity map",entity_map,key.map)

var get_entity_map = ds_get(envar,"entity map")
show("get entity map returned: " + string(get_entity_map))

for (var i = 1; i <= entity.types;i += 1)
    {
    var specific_map = ds_create(data.static,ds_type_map)
    ds_set(entity_map,i,specific_map,key.map)
    show("set i: " + string(i) + " to: " + string(specific_map))
    }

//create the prestep and poststep handling lists
entity_destroy_list = ds_create(data.static,ds_type_list)
entity_create_list = ds_create(data.static,ds_type_list)

//show("----------------")
//var get_entity_map = ds_get(envar,"entity map")
//show("get entity map returned: " + string(get_entity_map))
