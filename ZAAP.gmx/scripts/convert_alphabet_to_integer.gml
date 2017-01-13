var get_alphabet = argument0
var pow = 0
var int = 0

while string_length(get_alphabet)
    {
    var get_letter = string_char_at(get_alphabet,string_length(get_alphabet))
    get_alphabet = string_delete(get_alphabet,string_length(get_alphabet),1)
    var get_number = ord(get_letter) - 64
    show("get number is: " + string(get_number))
    int += get_number * power(10,pow)
    pow++
    }
show("int is: " + string(int))
return int
