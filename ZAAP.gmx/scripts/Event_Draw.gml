var draw_time_start = get_timer()

Event_View()

Draw_Navigation_Grid()

Draw_Main_Menu()

Draw_Entities()



ds_set(environment,"draw time",get_timer() - draw_time_start)
