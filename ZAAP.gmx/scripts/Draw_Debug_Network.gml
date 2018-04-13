///Draw_Debug_Network()

var view_width = view_wview[0]
var view_height = view_hview[0]
var get_text
var is_client = am_client()


if is_client
or am_server()
    {
    draw_set_alpha(1)
    
    var x1 = view_width-200
    var y1 = 100
    var x2 = view_width
    var y2 = 164 + is_client*32
    draw_set_color(c_gray)
    draw_rectangle(x1,y1,x2,y2,false)
    draw_set_color(c_black)
    draw_rectangle(x1,y1,x2,y2,true)
    
    font_align(9)
    
    get_text = "packets in: " + string(packets_in)
    draw_text(view_width,100,get_text)
    get_text = "packets out: " + string(packets_out)
    draw_text(view_width,116,get_text)
    get_text = "packet bytes in: " + string(packet_bytes_in)
    draw_text(view_width,132,get_text)
    get_text = "packet bytes out: " + string(packet_bytes_out)
    draw_text(view_width,148,get_text)
    
    if is_client
    and my_socket() >= 0
        {
        //draw the client timeout
        var get_map = my_socket()
        if is_zero(get_map) exit
        var get_ping_timeout = get("ping timeout")
        
        get_text = "since last packet: " + string(get_ping_timeout)
        draw_text(view_width,180,get_text)
        }
    }
