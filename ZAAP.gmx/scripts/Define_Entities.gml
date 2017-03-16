value_entity_types = 5

enum entity
    {
    null,
    asteroid,
    item,
    ship,
    bullet,
    shipyard,
    types,
    }

localized_entity_name = ds_map_create()
localized_entity_name[? entity.null] = "none"
localized_entity_name[? entity.asteroid] = "asteroid"
localized_entity_name[? entity.item] = "item"
localized_entity_name[? entity.ship] = "ship"
localized_entity_name[? entity.bullet] = "bullet"
localized_entity_name[? entity.shipyard] = "shipyard"
    
///fucktouple
//-Natesky9
