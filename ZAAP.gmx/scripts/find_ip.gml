var get_int = 0
var ip = ""

//nothing was entered
if keyboard_string == ""
or keyboard_string == " "
return -1

if string_count(".",keyboard_string) == 3
    {
    //full ip was entered
    ip = keyboard_string
    return ip
    }

if string(real(keyboard_string)) == keyboard_string
    {
    //int ip was entered
    var ip = convert_integer_to_ip(keyboard_string)
    return ip
    }

if !string_digits(keyboard_string)
and string_length(string_letters(keyboard_string)) == string_length(keyboard_string)
    {
    //letter code was entered
    int = convert_alphabet_to_integer(keyboard_string)
    ip = convert_integer_to_ip(keyboard_string)
    return ip
    }

return -1
