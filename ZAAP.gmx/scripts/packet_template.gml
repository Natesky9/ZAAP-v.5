var get_packet_array = argument0

switch get_packet_array[0]
    {
    case "server write":
        {
        return true
        }
    case "client read":
        {
        return true
        }
    case "client write":
        {
        return true
        }
    case "server read":
        {
        return true
        }
    default:
        {
        show("Error, no mode defined!")
        show("in packet_template")
        return false
        }
    }
