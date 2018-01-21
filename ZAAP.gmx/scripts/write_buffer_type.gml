///write_buffer_type
var input = argument0
//
var str = is_string(input)
if str
    {
    buffer_write(bout,buffer_u8,buffer_string)
    return buffer_string
    }
//
var neg = sign(input) == -1;
var int = frac(input) == 0;
//

//
if int
    {
    //
    if neg
        {
        //
        if input < (1 << 7)-1
        and input >= -(1 << 7)
            {
            buffer_write(bout,buffer_u8,buffer_s8)
            return buffer_s8
            }
        //
        if input < (1 << 15)-1
        and input >= -(1 << 15)
            {
            buffer_write(bout,buffer_u8,buffer_s16)
            return buffer_s16
            }
        //
        if input < (1 << 31)-1
        and input >= -(1 << 31)
            {
            buffer_write(bout,buffer_u8,buffer_s32)
            return buffer_s32
            }
        //
        }
    //
    if not neg
        {
        //
        if input < (2 << 7)-1
        and input >= -(2 << 7)
            {
            buffer_write(bout,buffer_u8,buffer_u8)
            return buffer_u8
            }
        //
        if input < (2 << 15)-1
        and input >= -(2 << 15)
            {
            buffer_write(bout,buffer_u8,buffer_u16)
            return buffer_u16
            }
        //
        if input < (2 << 31)-1
        and input >= -(2 << 31)
            {
            buffer_write(bout,buffer_u8,buffer_u32)
            return buffer_u32
            }
        //
        if input < (1 << 63)-1
        and input >= -(1 << 63)
            {
            buffer_write(bout,buffer_u8,buffer_u64)
            return buffer_u64
            }
        //
        }
    //
    }
//
if not int
    {
    /*
    if input < (1 << 15)-1
    and input >= -(1 << 15)
        {
        buffer_write(bout,buffer_u8,buffer_f16)
        return buffer_f16
        }
    //
    if input < (1 << 31)-1
    and input >= -(1 << 31)
        {
        buffer_write(bout,buffer_u8,buffer_f32)
        return buffer_f32
        }
    
    if input < (1 << 63)-1
    and input >= -(1 << 63)
    */
    if true
        {
        buffer_write(bout,buffer_u8,buffer_f64)
        return buffer_f64
        }
    //
    }
