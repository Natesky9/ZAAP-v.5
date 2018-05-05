///entity_type_to_name(type)
//convert type to entity name
//entity names are created in Define_Entities

var get_type = argument0

switch get_type
    {
    case entity.item:
        return "item"
    case entity.bullet:
        return "bullet"
    case entity.asteroid:
        return "asteroid"
    case entity.ship:
        return "ship"
    case entity.shipyard:
        return "shipyard"
    default:
        return "null"
    }

