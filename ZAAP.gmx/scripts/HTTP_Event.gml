var get_id = ds_map_find_value(async_load,"id")
var get_status = ds_map_find_value(async_load,"status")

switch get_id
    {
    case http_request_ip:
        {
        if get_status == 0
            {
            var result = ds_map_find_value(async_load,"result")
            console_add("IP is [" + string(result) + "]")
            IP = result
            var int_ip = convert_ip_to_integer(result)
            int_IP = int_ip
            if int_ip != -1
            var letter_ip = convert_integer_to_alphabet(int_ip)
            letter_IP = letter_ip
            exit
            }
        }
    default:
        {
        exit
        }
    }
