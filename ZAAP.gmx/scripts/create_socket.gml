var get_map = ds_create(ds_type_map)

var key_list = ds_create(ds_type_list)
ds_map_add(get_map,"key list",key_list)

return get_map
