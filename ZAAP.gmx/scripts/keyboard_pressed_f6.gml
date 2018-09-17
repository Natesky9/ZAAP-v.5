if not keyboard_check_pressed(vk_f6)
exit

var text = json_encode(envar)

ini_open("envar.ini")
var key_count = ds_size(envar)
for (var i = 0;i < key_count;i++)
    {
    var key = ds_index(envar,i)
    var value = ds_get(envar,key)
    ini_write_string("test",key,string(value))
    }
ini_close()

show("envar saved!")
