var get_uuid = argument0

var get_entity = entity_from_uuid(get_uuid)
var key_list = get_entity[? "key list"]
show("key list is: " + string(key_list))

var get_list_size = ds_list_size(key_list)
buffer_write(bout,buffer_u8,get_list_size)

for (var i = 0;i < get_list_size;i += 1)
    {
    var get_key = ds_list_find_value(key_list,i)
    var get_value = ds_get(get_entity,get_key)
    //write key to buffer
    show("write key to buffer")
    write_key_to_buffer(get_key,get_value)
    }

