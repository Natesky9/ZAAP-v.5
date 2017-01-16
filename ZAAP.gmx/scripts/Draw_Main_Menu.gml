if am_server()
or am_client()
exit


font_align(5)

draw_set_color(c_blue)

var size = sin(current_time/250)+3
d3d_transform_add_scaling(size,size,0)
d3d_transform_add_translation(size,size,0)
d3d_transform_add_translation(room_width/2,room_height/2,0)
draw_text(0,0,"ZAAP")
d3d_transform_set_identity()

draw_text(room_width/2,room_height/2+100,"'F1' to start server
                or type the ip and hit enter to join")
