var get_key = argument0
//show("converting key to buffer type")
//show("key is [" + get_key + "]")

switch get_key
    {
    //
    case "autopilot":
    case "thrust":
    case "brake":
        {
        //show("buffer is bool")
        //range is 0 - 1
        return buffer_bool
        }
    //
    case "steer":
        {
        //show("buffer is s8")
        //range is -128 - 127
        return buffer_s8
        }
    //
    /*
        {
        show("buffer is s16")
        return buffer_s16
        }
    */
    //
    case "x":
    case "y":
        {
        //show("buffer is s32")
        //range is -2,147,483,648 - 2,147,483,647
        return buffer_s32
        }
    //
    //unsigned//
    //
    case "pilot":
    case "type":
    case "socket":
    case "lifetime":
        {
        //show("buffer is u8")
        //range is 0 - 255
        return buffer_u8
        }
    //
    case "ping":
        {
        //show("buffer is u16")
        //range is 0 - 65,535
        return buffer_u16
        }
    //
    case "uuid":
    case "source":
    case "ship":
    case "packets in":
    case "packets out":
    case "packet bytes in":
    case "packet bytes out":
        {
        //show("buffer is u32")
        //range is 0 - 4,294,967,295
        return buffer_u32
        }
    //
    case "speed":
    case "direction":
    case "heading":
        {
        //show("buffer is f32")
        return buffer_f32
        }
    //
    default:
        {
        show("ERROR! Key [" + get_key + "] is not assigned a buffer type!")
        return false
        }
    }
