///Event_Draw_GUI()
draw_gui_time_start = get_timer()

Draw_Nearby_Entities()

Draw_Socket_List()

Draw_Entity_Lists()

Draw_Console()

Draw_Shipyard_GUI()


Draw_Debug()

ds_set(environment,"draw gui time",get_timer() - draw_gui_time_start)
