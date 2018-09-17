var get_entity = argument0
var get_key = argument1
var get_value = get_entity[? get_key]

switch get_key
    {
    //
    case "grid":
        {
        ds_destroy(ds_type_grid,get_value)
        break
        }
    //
    case "pilot":
        {
        var get_player = map_from_socket(get_value)
        
        //if it has no pilot, exit
        if is_zero(get_player)
        exit
        
        ds_set(get_player,"ship",0,key.value)
        console_add("object deleted, clearing socket association")
        break
        }
    default:
        {
        break
        }
    //
    }
