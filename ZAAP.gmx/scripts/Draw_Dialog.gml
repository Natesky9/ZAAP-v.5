draw_set_color(c_black)
font_align(1)
//add in dialog map

var dialogs = ds_list_size(dialog_list)

//draw the box
draw_set_color(c_gray)
draw_rectangle(0,room_height,240,room_height-16-16*dialogs,false)
draw_set_color(c_black)
draw_rectangle(0,room_height,240,room_height-16-16*dialogs,true)
draw_line(0,room_height-16,240,room_height-16)

//draw the texts
for (var i = 0;i < dialogs;i += 1)
    {
    var text = ds_list_find_value(dialog_list,i)
    draw_text(0,room_height-16-16*i,text)
    }
