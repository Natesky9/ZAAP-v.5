///convert_ip_to_integer(ip)

var get_ip = argument0
var get_pow = 0
var get_octet = 0
var get_int_ip;

get_int_ip[0] = 0

while string_length(get_ip)
    {
    var get_value = string_char_at(get_ip,string_length(get_ip))
    get_ip = string_delete(get_ip,string_length(get_ip),1)
    
    
    if get_value == "."
        {
        show("octet is: " + string(get_int_ip[get_octet]))
        get_pow = 0
        get_octet++
        get_int_ip[get_octet] = 0
        continue
        }
    if string_length(string_digits(get_value))
        {
        var real_value = real(get_value)
        var get_addition = real_value * power(10,get_pow);
        //show("get addition is: " +string(get_addition))
        get_int_ip[get_octet] += get_addition
        get_pow++
        continue
        }
    //if it is anything else
    show("Error, illegal value!")
    return -1
    }

show("octet is: " + string(get_int_ip[get_octet]))

var int_ip = 0
for (var i = 0;i < 4;i += 1)
    {
    int_ip += get_int_ip[i] * power(256,i)
    }

show(string(int_ip))
console_add("Int IP is: " + string(int_ip))
return int_ip

/*ip1=101
ip2=202
ip3=233
ip4=90

result=ip1;
result+=ip2<<8;
result+=ip3<<16;
result+=ip4<<24;
show_debug_message(result);
*/
