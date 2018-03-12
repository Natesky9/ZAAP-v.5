///initialize_registry()

registry = ds_construct(ds_type_map)


ds_set(registry,"envar",envar)

var entities = ds_construct(ds_type_map)
ds_set(registry,"entities",entities)
var entity_map = get("entity map")
for (var i = 1; i <= entity.types;i += 1)
    {
    var specific_map = fetch_entity_map(i)
    var specific_name = name_from_type(i)
    ds_set(entities,specific_name,specific_map)
    }


ds_set(registry,"sockets",sockets)
ds_set(registry,"dimensions",dimensions)                                                                                                                                                                                                                                                                                                                                                                                   



show_entity_registry = false
set("entity_registry_type_x1",100)
set("entity_registry_type_y1",100)
