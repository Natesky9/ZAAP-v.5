///initialize_entity_map()
//start defining the static entity map

//entity_map is the map of uuid -> map
var entity_map = ds_construct(ds_type_map)
set("entity map",entity_map)

for (var i = 1; i <= entity.types;i += 1)
    {
    var specific_map = ds_construct(ds_type_map)
    ds_set(entity_map,i,specific_map)
    }
/*
var item_entities = ds_construct(ds_type_map)
var bullet_entities = ds_construct(ds_type_map)
var asteroid_entities = ds_construct(ds_type_map)
var ship_entities = ds_construct(ds_type_map)
var shipyard_entities = ds_construct(ds_type_map)

ds_set(entity_map,"items",item_entities)
ds_set(entity_map,"bullets",bullet_entities)
ds_set(entity_map,"asteroids",asteroid_entities)
ds_set(entity_map,"ships",ship_entities)
ds_set(entity_map,"shipyards",shipyard_entities)

set("entity map",entity_map)
*/
