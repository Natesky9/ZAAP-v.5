//change to seperate
//client and server
//socket list?

if game_server < 0
and game_client < 0
exit

//draw the list of sockets
font_align(7)

var sockets = ds_list_size(socket_list)

//draw empty socket list
if sockets == 0
Draw_Socket_List_Empty()
//end drawing empty socket list

//draw populated socket list
if sockets > 0
    {
    draw_set_color(c_gray)
    draw_rectangle(0,0,140,sockets*16,false)
    draw_set_color(c_black)
    draw_rectangle(0,0,140,sockets*16,true)
    
    
    draw_set_color(c_black)
    for (var i = 0;i < sockets;i += 1)
        {
        draw_set_color(c_aqua)
        var get_socket = ds_list_find_value(socket_list,i)
        draw_text(8,16*i,"socket: " + string(get_socket))
        var get_map = map_from_socket(get_socket)
        var get_ping = get_map[? "ping"]
        
        if get_ping > 9999
            {
            get_ping = 9999
            }
        
        var get_custom_color = make_colour_hsv((9999-get_ping)/55.55,128,128)
        draw_set_color(get_custom_color)
        draw_text(88,16*i,"[" + string(get_ping) + "]")
        }
    }
//end drawing populated socket list
