///write_uuid_to_buffer(uuid)

var get_uuid = argument0

var get_entity = entity_from_uuid(get_uuid)
//###//
//This can be moved to
//write_list_to_buffer?

var key_list = keys_from_map(get_entity)
//show("key list is: " + string(key_list))

var get_list_size = ds_list_size(key_list)
//show("key list size is: " + string(get_list_size))
write(get_list_size)

//show("writing keys to buffer")
for (var i = 0;i < get_list_size;i += 1)
    {
    var get_key = ds_list_find_value(key_list,i)
    //write key to buffer
    write_key_to_buffer(get_entity,get_key)
    }
//show("done writing keys to buffer")
