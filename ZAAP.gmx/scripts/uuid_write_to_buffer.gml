var get_uuid = argument0
var get_buffer = argument1

var get_entity = entity_from_uuid(get_uuid)
var key_list = get_entity[? "key list"]

var get_list_size = ds_list_size(key_list)
buffer_write(get_buffer,buffer_u8,get_list_size)

for (var i = 0;i < get_list_size;i += 1)
    {
    var get_key = ds_list_find_value(key_list,i)
    show("key is: " + get_key)
    var buffer_type = key_to_buffer_type(get_key)
    var get_value = ds_get(get_entity,get_key)
    show("value is: " + string(get_value))
    
    buffer_write(get_buffer,buffer_string,get_key)
    buffer_write(get_buffer,buffer_type,get_value)
    }

