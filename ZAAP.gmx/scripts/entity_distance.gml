///entity_distance(entity_1,entity_2)
//returns the distance between two entities
//returns number

var entity_1 = argument0
var entity_2 = argument1

var entity_1_x = ds_get(entity_1,"x")
var entity_1_y = ds_get(entity_1,"y")

var entity_2_x = ds_get(entity_2,"x")
var entity_2_y = ds_get(entity_2,"y")

var distance = point_distance(entity_1_x,entity_1_y,entity_2_x,entity_2_y)

return distance
