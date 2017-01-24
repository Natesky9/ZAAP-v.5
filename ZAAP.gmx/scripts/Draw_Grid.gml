var get_x1 = view_xview[0]
var get_y1 = view_yview[0]
var get_width = view_wview[0]
var get_height = view_hview[0]
var get_x2 = get_x1 + get_width
var get_y2 = get_y1 + get_height
var x_start = ceil(get_x1/32)*32
var y_start = ceil(get_y1/32)*32
var x_num = floor(get_width/32)*32
var y_num = floor(get_height/32)*32
draw_set_color(c_blue)
draw_set_alpha(.1)
for (var ix = 0;ix < x_num;ix += 1)
    {
    draw_line(x_start+ix*32,get_y1,x_start+ix*32,get_y2)
    }
for (var iy = 0;iy < y_num;iy += 1)
    {
    draw_line(get_x1,y_start+iy*32,get_x2,y_start+iy*32)
    }
draw_set_alpha(1)
