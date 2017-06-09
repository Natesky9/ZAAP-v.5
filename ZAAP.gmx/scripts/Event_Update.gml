///Event_Update()
if not am_server()
exit

//every second
if ds_get(envar,"steps since start") mod 15
exit

for (var i = 0;i < ds_list_size(entity_list);i += 1)
    {
    var get_list = ds_list_find_value(entity_list,i)
    for (var ii = 0;ii < ds_list_size(get_list);ii += 1)
        {
        var get_uuid = ds_list_find_value(get_list,ii)
        var get_entity = entity_from_uuid(get_uuid)
        if is_zero(get_entity)
        continue
        //packet_rubberband_entity
        packet_write(packet.rubberband_entity,get_uuid)
        }
    }
