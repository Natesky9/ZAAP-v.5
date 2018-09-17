///initialize_registry()

registry = ds_create(data.permanent,ds_type_map)


ds_set(registry,"envar",envar,key.map)

var entities = ds_create(data.static,ds_type_map)
ds_set(registry,"entities",entities,key.map)
var entity_map = ds_get(envar,"entity map")
for (var i = 1; i <= entity.types;i += 1)
    {
    var specific_map = fetch_entity_map(i)
    var specific_name = name_from_type(i)
    ds_set(entities,specific_name,specific_map,key.map)
    }


ds_set(registry,"sockets",sockets,key.map)
ds_set(registry,"dimensions",dimensions,key.map)                                                                                                                                                                                                                                                                                                                                                                                   



show_entity_registry = false
ds_set(envar,"entity_registry_type_x1",100,key.value)
ds_set(envar,"entity_registry_type_y1",100,key.value)
