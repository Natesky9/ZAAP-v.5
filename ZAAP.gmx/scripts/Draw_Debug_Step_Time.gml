var view_width = view_wview[0]
var view_height = view_hview[0]

var get_text

font_align(6)
draw_set_color(c_black)

get_text = "step time [" + string(step_time) + "]"
draw_text(view_width,400,get_text)

get_text = "draw time [" + string(draw_time) + "]"
draw_text(view_width,416,get_text)