var get_int = argument0
var pow = 3
var ip_string = ""

for (var i = 0;i < 4;i += 1)
    {
    var num = (get_int div power(256,pow))
    show("Num is: " + string(num))
    get_int -= (num * power(256,pow))
    ip_string += string(num)
    if pow
    ip_string += "."
    
    pow--
    }
show("IP string is: " + ip_string)
return ip_string

/*
rp4=result>>24; result-=rp4<<24;
rp3=result>>16; result-=rp3<<16;
rp2=result>>8;    result-=rp2<<8;
rp1=result;
//show_debug_message(rp1);

show_debug_message(string(rp4)+"."+string(rp3)+"."+string(rp2)+"."+string(rp1));
*/
