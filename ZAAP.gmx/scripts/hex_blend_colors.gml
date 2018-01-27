///hex_blend_colors(1,2,3)
//blends the colors for a hexagon vertex
var color_1 = argument0
var color_2 = argument1
var color_3 = argument2

var hue1 = colour_get_hue(color_1)
var hue2 = colour_get_hue(color_2)
var hue3 = colour_get_hue(color_3)
var sat1 = colour_get_saturation(color_1)
var sat2 = colour_get_saturation(color_2)
var sat3 = colour_get_saturation(color_3)
var val1 = colour_get_value(color_1)
var val2 = colour_get_value(color_2)
var val3 = colour_get_value(color_3)

return make_colour_hsv(mean(hue1,hue2,hue3),mean(sat1,sat2,sat3),mean(val1,val2,val3))
