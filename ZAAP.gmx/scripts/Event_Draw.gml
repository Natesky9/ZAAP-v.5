draw_set_color(c_black)
draw_set_halign(fa_right)
draw_set_valign(fa_top)
draw_text(room_width,8,"server: " + string(game_server))
draw_text(room_width,24,"client: " + string(game_client))

Draw_Socket_List()


Draw_Console()
