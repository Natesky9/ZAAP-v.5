var get_x1 = view_xview[0]
var get_y1 = view_yview[0]
var get_width = view_wview[0]
var get_height = view_hview[0]
var get_x2 = get_x1 + get_width
var get_y2 = get_y1 + get_height
var width_num = get_width div 32
var height_num = get_height div 32
var x_num = get_x1 div 32
var y_num = get_y1 div 32
var x_start = 32 * x_num
var y_start = 32 * y_num
//num is the number
//end num


draw_set_alpha(.1)
for (var ix = 0;ix < width_num;ix += 1)
    {
    var get_x_value = ix + x_num
    //width = 1
    
    draw_set_color(c_blue)
    if not abs((get_x_value mod 10))
        {
        draw_set_color(c_green)
        }
    if not abs((get_x_value mod 100))
        {
        draw_set_color(c_black)
        }
    draw_rectangle(x_start+ix*32-2,get_y1,x_start+ix*32+2,get_y2,false)
    }
draw_set_color(c_blue)
for (var iy = 0;iy < height_num;iy += 1)
    {
    var get_y_value = iy + y_num
    //width = 1
    
    draw_set_color(c_blue)
    if not abs((get_y_value mod 10))
        {
        draw_set_color(c_green)
        }
    if not abs((get_y_value mod 100))
        {
        draw_set_color(c_black)
        }
    draw_rectangle(get_x1,y_start+iy*32-2,get_x2,y_start+iy*32+2,false)
    }
draw_set_alpha(1)
