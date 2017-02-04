var view_width = view_wview[0]
var view_height = view_hview[0]

font_align(1)
draw_set_color(c_ltgray)
draw_rectangle(view_width,view_height,view_width-200,view_height-16*6,false)
draw_set_color(c_dkgray)
draw_rectangle(view_width,view_height,view_width-200,view_height-16*6,true)

draw_set_color(c_blue)
draw_text(view_width-200,view_height-0,"grid[" + string(data_structure_grid_amount) + "]")
draw_set_color(c_blue)
draw_text(view_width-200,view_height-16,"list[" + string(data_structure_list_amount) + "]")
draw_set_color(c_blue)
draw_text(view_width-200,view_height-32,"map[" + string(data_structure_map_amount) + "]")
draw_set_color(c_blue)
draw_text(view_width-200,view_height-48,"priority[" + string(data_structure_priority_amount) + "]")
draw_set_color(c_blue)
draw_text(view_width-200,view_height-64,"queue[" + string(data_structure_queue_amount) + "]")
draw_set_color(c_blue)
draw_text(view_width-200,view_height-80,"stack[" + string(data_structure_stack_amount) + "]")
