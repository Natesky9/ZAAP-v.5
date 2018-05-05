///Draw_Socket_List()

if not am_server()
and not am_client()
exit

//draw the list of socket_count
font_align(7)

var socket_count = ds_size(sockets)

//draw empty socket list
if socket_count == 0
Draw_Socket_List_Empty()
//end drawing empty socket list

//draw populated socket list
if socket_count > 0
    {
    draw_set_color(c_gray)
    draw_rectangle(0,0,140,socket_count*16,false)
    draw_set_color(c_black)
    draw_rectangle(0,0,140,socket_count*16,true)
    
    
    draw_set_color(c_black)
    for (var i = 0;i < socket_count;i += 1)
        {
        draw_set_color(c_aqua)
        var get_socket = ds_index(sockets,i)
        draw_text(8,16*i,"socket: " + string(get_socket))
        var get_map = map_from_socket(get_socket)
        if is_zero(get_map) continue
        var get_ping = ds_get(get_map,"ping")
        if is_zero(get_ping) continue
        
        if get_ping > 9999
            {
            get_ping = 9999
            }
        
        var get_custom_color = make_colour_hsv((9999-get_ping)/55.55,128,128)
        draw_set_color(get_custom_color)
        draw_text(88,16*i,"[" + string(get_ping) + "]")
        //done drawing ping
        
        //draw the ship
        var get_ship = ds_get(get_map,"ship")
        draw_set_colour(c_blue)
        draw_text(120,16*i,"[" + string(get_ship) + "]")
        }
    }
//end drawing populated socket list
