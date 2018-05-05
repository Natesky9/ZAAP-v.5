///Draw_Debug_DS_Amount()

var view_width = view_wview[0]
var view_height = view_hview[0]

draw_set_color(c_ltgray)
draw_rectangle(view_width,view_height,view_width-200,view_height-16*6,false)
draw_set_color(c_dkgray)
draw_rectangle(view_width,view_height,view_width-200,view_height-16*6,true)

font_align(7)
draw_set_color(c_blue)
draw_text(view_width-200,view_height-16,"[static maps" + string(ds_list_size(static_maps) + "]"))
draw_text(view_width-200,view_height-32,"[static lists" + string(ds_list_size(static_lists) + "]"))
draw_text(view_width-200,view_height-48,"[static grids" + string(ds_list_size(static_grids) + "]"))
draw_text(view_width-200,view_height-64,"[dynamic maps" + string(ds_list_size(dynamic_maps) + "]"))
draw_text(view_width-200,view_height-80,"[dynamic lists" + string(ds_list_size(dynamic_lists) + "]"))
draw_text(view_width-200,view_height-96,"[dynamic grids" + string(ds_list_size(dynamic_grids) + "]"))
