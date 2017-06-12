///entity_subtract_vector(get_entity,get_vector_speed)
//subtracts a motion vector to the entity

var get_entity = argument0
var get_vector_speed = argument1;
var get_vector_direction = argument2;

var get_x = ds_get(get_entity,"x");
var get_y = ds_get(get_entity,"y");
var get_direction = ds_get(get_entity,"direction");
var get_speed = ds_get(get_entity,"speed");

get_speed -= get_vector_speed

var final_speed = max(0,get_speed);

get_entity[? "speed"] = final_speed
