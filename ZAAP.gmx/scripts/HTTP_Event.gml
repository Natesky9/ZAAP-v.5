///HTTP_Event()

var get_id = ds_map_find_value(async_load,"id")
var get_status = ds_map_find_value(async_load,"status")
show("received http data")


switch get_id
    {
    case http_request_ip:
        {
        if get_status == 0
            {
            var result = ds_map_find_value(async_load,"result")
            show("result is [" + string(result) + "]")
            console_add("IP is [" + string(result) + "]")
            var IP = result
            ds_set(envar,"IP",IP,key.text)
            var int_ip = convert_ip_to_integer(result)
            ds_set(envar,"integer IP",int_ip,key.value)
            if int_ip != -1
            var letter_ip = convert_integer_to_alphabet(int_ip)
            ds_set(envar,"letter IP",letter_ip,key.text)
            exit
            }
        }
    default:
        {
        exit
        }
    }
