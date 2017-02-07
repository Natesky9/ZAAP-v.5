///Draw_Entity_Bullet(get_entity)
var get_entity = argument0

//get the map data
var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")
var get_speed = ds_get(get_entity,"speed")
var get_direction = ds_get(get_entity,"direction")
var get_heading = ds_get(get_entity,"heading")
//end getting map data

//get ready to draw
d3d_transform_add_translation(-get_x,-get_y,0)
d3d_transform_add_rotation_z(get_heading-90)
d3d_transform_add_translation(get_x,get_y,0)
//ready to draw

//draw the bullet
draw_set_color(c_red)
draw_circle(get_x,get_y,8,false)
draw_set_color(c_black)
draw_circle(get_x,get_y,8,true)
//draw the tail
effect_create_above(ef_spark,get_x,get_y,0,c_red)

//we're done here
d3d_transform_set_identity()
