var get_key = argument0
show("converting key to buffer type")
show("key is [" + get_key + "]")

switch get_key
    {
    //
    case "steer":
        {
        show("buffer is s8")
        return buffer_s8
        }
    //
    case "xspd":
    case "yspd":
        {
        show("buffer is s16")
        return buffer_s16
        }
    //
    case "x":
    case "y":
        {
        show("buffer is s32")
        return buffer_s32
        }
    //
    case "thrust":
    case "brake":
        {
        show("buffer is u8")
        return buffer_u8
        }
    //
    case "uuid":
        {
        show("buffer is u32")
        return buffer_u32
        }
    //
    default:
        {
        show("ERROR! Key [" + get_key + "] is not assigned a buffer type!")
        exit
        }
    }
