///Event_Update()
if not am_server()
exit

//every second
if ds_get(environment,"steps since start") mod 15
exit

for (var i = 0;i < ds_list_size(entity_list);i += 1)
    {
    var get_uuid = ds_list_find_value(entity_list,i)
    var get_entity = entity_from_uuid(get_uuid)
    if is_zero(get_entity)
    continue

    packet_write(packet.rubberband_entity,get_uuid)
    }
