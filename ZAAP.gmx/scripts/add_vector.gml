//adds a motion vector to the entity

var get_entity = argument0
var get_vector_speed = argument1;
var get_vector_direction = argument2;

var get_x = ds_get(get_entity,"x");
var get_y = ds_get(get_entity,"y");
var get_direction = ds_get(get_entity,"direction");
var get_speed = ds_get(get_entity,"speed");

var vector_x = lengthdir_x(get_vector_speed,get_vector_direction);
var vector_y = lengthdir_y(get_vector_speed,get_vector_direction);

var initial_vector_x = lengthdir_x(get_speed,get_direction);
var initial_vector_y = lengthdir_y(get_speed,get_direction);

var combined_vector_x = initial_vector_x + vector_x;
var combined_vector_y = initial_vector_y + vector_y;

var changed_speed = point_distance(0,0,combined_vector_x,combined_vector_y)
var changed_direction = point_direction(0,0,combined_vector_x,combined_vector_y);

var final_speed = convert_to_buffer_type("speed",changed_speed);
var final_direction = convert_to_buffer_type("direction",changed_direction);

get_entity[? "speed"] = final_speed
get_entity[? "direction"] = final_direction
