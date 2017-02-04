//read_buffer_to_key(get_entity)

var get_entity = argument0

var get_key = buffer_read(bin,buffer_string)

switch get_key
    {
    //
    case "grid":
        {
        //do something special here
        var get_grid = ds_create(ds_type_grid,1,1)
        read_buffer_to_grid(get_grid)
        console_add("read grid")
        map_add_new_key(get_entity,"grid",get_grid)
        exit
        }
    //
    default:
        {
        var get_buffer_type = key_to_buffer_type(get_key)
        var get_value = buffer_read(bin,get_buffer_type);
        
        if not is_zero(get_entity)
        get_entity[? get_key] = get_value
        
        //we're done here
        exit
        }
    //
    }
