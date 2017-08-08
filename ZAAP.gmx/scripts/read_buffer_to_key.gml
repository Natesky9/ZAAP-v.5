///read_buffer_to_key(entity)

var get_entity = argument0

var get_key = read()


switch get_key
    {
    //
    case "grid":
        {
        //do something special here
        var get_grid = ds_create(ds_type_grid,1,1)
        read_buffer_to_grid(get_grid)
        console_add("read grid")
        ds_set(get_entity,"grid",get_grid)
        exit
        }
    //
    case "vertex buffer":
        {
        console_add("how did you even get here?")
        exit
        }
    //
    default:
        {
        var get_value = read()
        
        if not is_zero(get_entity)
        ds_set(get_entity,get_key,get_value)
        //we're done here
        exit
        }
    //
    }
