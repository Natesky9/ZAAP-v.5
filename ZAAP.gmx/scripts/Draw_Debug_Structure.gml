///Draw_Debug_Structure()

var permanent_map_count = ds_list_size(permanent_maps)
var permanent_list_count = ds_list_size(permanent_lists)

var static_map_count = ds_list_size(static_maps)
var static_list_count = ds_list_size(static_lists)

var dynamic_map_count = ds_list_size(dynamic_maps)
var dynamic_list_count = ds_list_size(dynamic_lists)
var dynamic_grid_count = ds_list_size(dynamic_grids)

var view_width = view_wview[0]
var view_height = view_hview[0]

draw_set_color(c_gray)
draw_rectangle(view_width-200,200,view_width,344,false)
draw_set_color(c_black)
draw_rectangle(view_width-200,200,view_width,344,true)
font_align(9)

draw_text(view_width,200,"permanent maps: " + string(permanent_map_count))
draw_text(view_width,216,"permanent lists: " + string(permanent_list_count))

draw_text(view_width,248,"static maps: " + string(static_map_count))
draw_text(view_width,260,"static lists: " + string(static_list_count))

draw_text(view_width,292,"dynamic maps: " + string(dynamic_map_count))
draw_text(view_width,308,"dynamic lists: " + string(dynamic_list_count))
draw_text(view_width,324,"dynamic grids: " + string(dynamic_grid_count))
