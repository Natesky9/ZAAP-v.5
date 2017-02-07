//get color from value
var get_value = argument0

var red = (get_value mod 2)*128
var green = (get_value mod 4)*64
var blue = (get_value mod 8)*32

var get_grid_color = make_colour_rgb(red,green,blue)

return get_grid_color

/*
switch get_value
    {
    //
    case 0:
        {
        
        }
    }
*/
