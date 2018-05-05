///get_key_type(input)
//returns the type of data
//add to this as you make new names for maps
var input = argument0

switch input
    {
    case "map":
    case "registry":
    case "envar":
    case "entities":
    case "sockets":
    case "dimensions":
    case "elements":
    case "inventory":
    case "focus":
    case "dynamic maps":
    case "dynamic lists":
    case "dynamic grids":
    case "static maps":
    case "static lists":
    case "static grids":
    case "item":
    case "bullet":
    case "asteroid":
    case "ship":
    case "shipyard":
    case "all":
        {
        return ds_type_map
        }
    case "list":
        {
        return ds_type_list
        }
    case "grid":
        {
        return ds_type_grid
        }
    default:
        {
        if is_string(input)
        return false
        else return ds_type_map
        }
    }
