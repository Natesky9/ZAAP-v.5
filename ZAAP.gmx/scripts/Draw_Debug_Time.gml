///Draw_Debug_Step_Time()

var get_text
var view_width = view_wview[0]
var view_height = view_hview[0]

draw_set_color(c_gray)
draw_rectangle(view_width-150,400,view_width,432,false)
draw_set_color(c_black)
draw_rectangle(view_width-150,400,view_width,432,true)

font_align(9)
get_text = "step time [" + string(get("step time")) + "]"
draw_text(view_width,400,get_text)

get_text = "draw time [" + string(get("draw time")) + "]"
draw_text(view_width,416,get_text)
