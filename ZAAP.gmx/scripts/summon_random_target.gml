///summon_random_target(target)
//summon a random ship, targeting
//the uuid supplied
var get_target = argument0
//spawn in enemies targeting a ship
var random_x = irandom_range(-1000,1000)
var random_y = irandom_range(-1000,1000)
var random_angle = irandom(360)
var new_grid = ds_create(ds_type_grid,9,9)

randomize_grid(new_grid)


var get_uuid = entity_create_server(random_x,random_y,entity.ship)
var get_entity = entity_from_uuid(get_uuid)
ds_set(get_entity,"x",random_x)
ds_set(get_entity,"y",random_y)
ds_set(get_entity,"heading",random_angle)

ds_set(get_entity,"grid",new_grid)

//set the target
ds_set(get_entity,"target",get_target)

//packet_entity_create
packet_write(packet.entity_create,get_uuid)
