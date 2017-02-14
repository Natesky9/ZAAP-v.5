var get_entity = argument0
var get_key = argument1
var get_value = get_entity[? get_key]

show("key to be deleted is: " + get_key)
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
        var get_socket_map = ds_get(socket_map,get_value)
        
        //if it has no pilot, exit
        if is_zero(get_socket_map)
        exit
        
        ds_set(get_socket_map,"ship",0)
        console_add("object deleted, clearing socket association")
        break
        }
    default:
        {
        
        }
    //
    }
