var get_num;

do get_num = irandom(1<<32 - 1)
until ds_map_find_value(entity_map,get_num) == undefined

return get_num
