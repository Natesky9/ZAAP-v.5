///draw_effect_beam(entity,entity)
//draws an effect from entity 1 to entity 2
var get_entity = argument0
var get_other_entity = argument1

var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")
var get_other_x = ds_get(get_other_entity,"x")
var get_other_y = ds_get(get_other_entity,"y")

var get_distance = point_distance(get_x,get_y,get_other_x,get_other_y)
var get_direction = point_direction(get_x,get_y,get_other_x,get_other_y)

var steps = get_distance div 10

var point_x,point_y,effect_x,effect_y
for (var i = 0;i < steps;i++)
    {
    point_x = lengthdir_x(i*10,get_direction)
    point_y = lengthdir_y(i*10,get_direction)
    
    effect_x = get_x + point_x
    effect_y = get_y + point_y
    
    effect_create_above(ef_spark,effect_x,effect_y,0,c_blue)
    }
