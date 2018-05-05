///write_key_to_buffer(key,value)

//writes the key as string
//writes the value as the correct value
var get_entity = argument0
var get_key = argument1

write(get_key)

switch get_key
    {
    //--------------------------------//
    case "grid":
        {
        //treat as grid
        var get_grid = ds_get(get_entity,get_key)
        write_grid_to_buffer(get_grid)
        exit
        }
    //--------------------------------//
    case "inventory":
        {
        show("Writing inventory")
        //treat as map
        var get_map = ds_get(get_entity,get_key)
        write_map_to_buffer(get_map)
        }
    //--------------------------------//
    case "vertex buffer":
        {
        //show("nothing special here, just the vertex buffer")
        exit
        }
    //--------------------------------//
    case "key list":
        {
        show("already sending the key list")
        exit
        }
    //--------------------------------//
    default:
        {
        var get_value = ds_get(get_entity,get_key)
        
        //show("key: " + string(get_key))
        //show("value: " + string(get_value))
        write(get_value)
        exit
        //we're done here
        }
    //--------------------------------//
    }
