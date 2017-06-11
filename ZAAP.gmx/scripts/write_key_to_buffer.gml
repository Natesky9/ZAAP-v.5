///write_key_to_buffer(key,value)

//writes the key as string
//writes the value as the correct value
var get_key = argument0
var get_value = argument1

buffer_write(bout,buffer_string,get_key)

switch get_key
    {
    //
    case "grid":
        {
        //do something special here
        show("write grid")
        write_grid_to_buffer(get_value)
        exit
        }
    //
    case "vertex buffer":
        {
        show("nothing special here, just the vertex buffer")
        exit
        }
    //
    case "key list":
        {
        show("already sending the key list")
        exit
        }
    //
    default:
        {
        var get_buffer_type = key_to_buffer_type(get_key)
        buffer_write(bout,get_buffer_type,get_value)
        exit
        //we're done here
        }
    //
    }
