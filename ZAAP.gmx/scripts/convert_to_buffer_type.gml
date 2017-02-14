var get_key = argument0
var get_value = argument1

show("starting value is: " + string(get_value))

var get_buffer_type = key_to_buffer_type(get_key)
if is_zero(get_buffer_type)
    {
    show("Error, this value isn't assigned a buffer type")
    return false
    }

switch get_buffer_type
    {
    //
    case buffer_u8:
        {
        get_value = clamp(get_value,0,255)
        get_value = get_value div true
        break;
        }
    case buffer_s8:
        {
        get_value = clamp(get_value,-128,127)
        get_value = get_value div true
        break;
        }
    case buffer_u16:
        {
        get_value = clamp(get_value,0,power(2,16)-1)
        get_value = get_value div true
        break;
        }
    case buffer_s16:
        {
        get_value = clamp(get_value,-32768,32767)
        get_value = get_value div true
        break;
        }
    case buffer_u32:
        {
        get_value = clamp(get_value,0,power(2,32)-1)
        get_value = get_value div true
        break;
        }
    case buffer_u64:
        {
        //fuck trying to clamp that
        //get_value = clamp(get_value)
        get_value = get_value div true
        break;
        }
    case buffer_f16:
        {
        //not used
        //get_value = clamp(get_value)
        break;
        }
    case buffer_f32:
        {
        //get_value = clamp(get_value,-16777216,16777216)
        break;
        }
    case buffer_f64:
        {
        get_value = clamp(get_value,-power(2,63),power(2,63)-1)
        break;
        }
    case buffer_bool:
        {
        get_value = (get_value == true)
        break;
        }
    //
    }
show("returned value is: " + string(get_value))
return get_value
