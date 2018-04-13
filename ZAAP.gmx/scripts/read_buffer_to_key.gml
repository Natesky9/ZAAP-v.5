///read_buffer_to_key(entity)

var get_entity = argument0

var get_key = read()


switch get_key
    {
    //--------------------------------//
    case "grid":
        {
        //treat as grid
        var get_grid = ds_create(data.dynamic,ds_type_grid,1,1)
        read_buffer_to_grid(get_grid)
        console_add("read grid")
        ds_set(get_entity,"grid",get_grid)
        exit
        }
    //--------------------------------//
    case "inventory":
        {
        var get_list = ds_create(data.dynamic,ds_type_list)
        read_buffer_to_list(get_list)
        //treat as list
        exit
        }
    //--------------------------------//
    case "vertex buffer":
        {
        //don't do anything
        exit
        }
    //
    default:
        {
        var get_value = read()
        show("read value, " + get_key + "|" + string(get_value))
        
        if not is_zero(get_entity)
        ds_set(get_entity,get_key,get_value)
        //we're done here
        exit
        }
    //
    }
