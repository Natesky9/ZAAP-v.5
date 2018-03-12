///random_32()
//random 32 bit number, used for uuid

var get_num;
var entity_map = fetch_entity_map(entity.types)

do get_num = irandom(1<<32 - 2)+1
until ds_map_find_value(entity_map,get_num) == undefined

//show("new uuid is[" + string(get_num) + "]")

return get_num
