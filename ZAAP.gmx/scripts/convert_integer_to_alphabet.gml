///convert_integer_to_alphabet(integer)

//takes an ip integer, and converts it to an alphabetic IP
var get_int = argument0
var get_str = string(get_int)
var ip_string = ""

while string_length(get_str)
    {
    var get_value = string_char_at(get_str,1);
    get_str = string_delete(get_str,1,1);
    var get_letter = chr(65+real(get_value));
    //show("Letter is: " + get_letter)
    ip_string += get_letter;
    }
show("ip string is: " + ip_string)
return ip_string
