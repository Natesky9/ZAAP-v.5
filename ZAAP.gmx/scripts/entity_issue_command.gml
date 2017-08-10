///entity_issue_command(entity,command,value)

var get_entity = argument0
var get_command = argument1
var get_value = argument2

ds_set(get_entity,get_command,get_value)

var get_uuid = uuid_from_entity(get_entity)

if am_client()
    {
    //packet_issue_command
    packet_write(packet.issue_command,get_uuid,get_command,get_value)
    exit
    }
if am_server()
    {
    //packet_issue_command
    packet_write(packet.issue_command,get_uuid,get_command,get_value)
    exit
    }
