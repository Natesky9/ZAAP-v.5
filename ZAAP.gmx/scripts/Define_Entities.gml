enum entity
    {
    null,
    item,
    bullet,
    asteroid,
    ship,
    shipyard,
    types,//this defines how many types are available
    //do not insert any after types
    }

localized_entity_name = ds_map_create()
localized_entity_name[? entity.null] = "none"
localized_entity_name[? entity.asteroid] = "asteroid"
localized_entity_name[? entity.item] = "item"
localized_entity_name[? entity.ship] = "ship"
localized_entity_name[? entity.bullet] = "bullet"
localized_entity_name[? entity.shipyard] = "shipyard"

localized_entity_name[? entity.types] = "all"

///fucktouple
//-Natesky9
