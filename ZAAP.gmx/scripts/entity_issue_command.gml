var get_entity = argument0
var get_command = argument1
var get_value = argument2

ds_set(get_entity,get_command,get_value)

if am_client()
    {
    packet_write(packet.issue_command,get_command,get_value)
    exit
    }
if am_server()
    {
    packet_write(packet.issue_command,get_entity,get_command,get_value)
    exit
    }
