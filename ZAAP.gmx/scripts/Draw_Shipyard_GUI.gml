///Draw_Shipyard_GUI()

if not am_client()
exit

var get_entity = get_ship_from_socket(SSS)
if is_zero(get_entity)
exit

var is_docked = ds_get(get_entity,"docked to")
//this isn't working correctly
if is_docked
    {
    var x1 = 500
    var y1 = 500
    var x2 = 700
    var y2 = 700
    draw_set_color(c_gray)
    draw_rectangle(x1,y1,x2,y2,false)
    draw_set_color(c_black)
    draw_rectangle(x1,y1,x2,y2,true)
    font_align(5)
    draw_text(600,600,"Shipyard")
    }
