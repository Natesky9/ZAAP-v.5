///Draw_Socket_List_Empty()

//If there are no clients connected
draw_set_color(c_gray)
draw_rectangle(0,0,200,16,false)
draw_set_color(c_black)
draw_rectangle(0,0,200,16,true)
draw_set_color(c_blue)
draw_text(0,0,"No clients connected")

//all alone...
