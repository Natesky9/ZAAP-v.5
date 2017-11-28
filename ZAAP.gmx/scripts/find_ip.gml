///find_ip()


var get_int = 0
var ip = ""

//nothing was entered
if keyboard_string == ""
return -1

if keyboard_string == "localhost"
return "127.0.0.1"

if string_count(".",keyboard_string) == 3
    {
    //full ip was entered
    console_add("Connecting via IP")
    ip = keyboard_string
    console_add(ip)
    return ip
    }

if string(real(keyboard_string)) == keyboard_string
and real(keyboard_string) != 0
    {
    //int ip was entered
    console_add("Connecting via int IP")
    var ip = convert_integer_to_ip(real(keyboard_string))
    console_add(ip)
    return ip
    }

if !string_digits(keyboard_string)
and string_length(string_letters(keyboard_string)) == string_length(keyboard_string)
    {
    //letter code was entered
    console_add("Connecting via letter code")
    int = convert_alphabet_to_integer(keyboard_string)
    ip = convert_integer_to_ip(int)
    console_add(ip)
    return ip
    }

console_add("No ip matches!")
return -1
