///Draw_Shipyard_GUI()

if not am_client()
exit

var get_entity = my_ship()
if is_zero(get_entity)
exit

var is_docked = ds_get(get_entity,"docked")
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
    }
