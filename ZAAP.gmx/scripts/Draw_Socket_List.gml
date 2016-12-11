//draw the list of sockets
font_align(7)
var sockets = ds_list_size(socket_list)

draw_set_color(c_gray)
draw_rectangle(0,0,64,sockets*16,false)
draw_set_color(c_black)
draw_rectangle(0,0,64,sockets*16,true)

draw_set_color(c_black)
for (var i = 0;i < sockets;i += 1)
    {
    var get_socket = ds_list_find_value(socket_list,i)
    draw_text(8,16*i,"socket: " + string(get_socket))
    }
