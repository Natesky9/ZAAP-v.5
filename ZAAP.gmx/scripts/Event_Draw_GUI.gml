///Event_Draw_GUI()
draw_gui_time_start = get_timer()

Draw_Nearby_Entities()

Draw_Socket_List()

Draw_Elements()
Draw_Entity_Registry()

Draw_Console()

Draw_Shipyard_GUI()


Draw_Debug_Elements()

ds_set(envar,"draw gui time",get_timer() - draw_gui_time_start,key.value)
