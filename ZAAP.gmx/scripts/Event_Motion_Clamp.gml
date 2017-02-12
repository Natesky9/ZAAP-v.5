var get_entity = argument0

var get_type = ds_get(get_entity,"type")
var get_speed = ds_get(get_entity,"speed")
var get_heading = ds_get(get_entity,"heading")

if get_type == entity.ship
get_speed = clamp(get_speed,0,8)

get_heading = (get_heading + 360) mod 360
get_entity[? "speed"] = get_speed
get_entity[? "heading"] = get_heading
