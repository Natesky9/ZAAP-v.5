///name_from_type
//returns the string name
//given the entity id

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
    case entity.types:
        return "all"
    default:
        return "null"
    }

