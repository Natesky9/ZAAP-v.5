///Draw_Shipyard_GUI()

if not am_client()
exit

var get_entity = get_ship_from_socket(get("SSS"))
if is_zero(get_entity)
exit

var is_docked = ds_get(get_entity,"docked to")
//this isn't working correctly
if is_docked
    {
    var x1 = get("shipyard x1")
    var y1 = get("shipyard y1")
    var x2 = get("shipyard x2")
    var y2 = get("shipyard y2")
    draw_set_color(c_gray)
    draw_rectangle(x1,y1,x2,y2,false)
    draw_set_color(c_black)
    draw_rectangle(x1,y1,x2,y2,true)
    var shipyard_title = mean(x1,x2)
    font_align(8)
    draw_text(y1,shipyard_title,"Shipyard")
    }
