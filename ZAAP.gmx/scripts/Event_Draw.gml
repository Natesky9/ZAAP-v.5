draw_time = get_timer()

Event_View()

Draw_Navigation_Grid()

Draw_Main_Menu()



Draw_Entities()

draw_time = get_timer() - draw_time

//show("draw_time: " + string(draw_time))
