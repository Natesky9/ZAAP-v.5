var get_x = argument0
var get_y = argument1

//create a uuid for it
var get_uuid = random_32()

//create it and get it's id
create_entity(get_uuid,get_x,get_y)




show("entity created with uuid of [" + string(get_uuid) + "]")

return get_uuid
