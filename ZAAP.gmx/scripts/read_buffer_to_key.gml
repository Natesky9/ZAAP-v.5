///read_buffer_to_key(entity)

var get_entity = argument0

var get_key = read()

///###/// change to use the new key.value format
switch get_key
    {
    //--------------------------------//
    case "grid":
        {
        //treat as grid
        var get_grid = ds_create(data.dynamic,ds_type_grid,1,1)
        read_buffer_to_grid(get_grid)
        console_add("read grid")
        ds_set(get_entity,"grid",get_grid,key.grid)
        exit
        }
    //--------------------------------//
    case "inventory":
        {
        //treat as map
        var get_map = ds_create(data.dynamic,ds_type_map)
        ds_set(get_entity,"inventory",get_map,key.map)
        show("Reading inventory")
        read_buffer_to_map(get_map)
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
        //show("read value, " + get_key + "|" + string(get_value))
        
        if not is_zero(get_entity)
        ds_set(get_entity,get_key,get_value,key.value)
        //we're done here
        exit
        }
    //
    }
