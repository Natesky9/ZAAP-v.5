draw_set_color(c_black)
font_align(1)
//add in console map

var console_messages = ds_list_size(console_list)

//draw the box
draw_set_color(c_gray)
draw_rectangle(0,room_height,240,room_height-16-16*console_messages,false)
draw_set_color(c_black)
draw_rectangle(0,room_height,240,room_height-16-16*console_messages,true)
draw_line(0,room_height-16,240,room_height-16)

//draw the texts
for (var i = 0;i < console_messages;i += 1)
    {
    var text = ds_list_find_value(console_list,i)
    draw_text(0,room_height-16-16*i,text)
    }

//draw the cursor and the typed text
var get_text = keyboard_string
draw_text(0,room_height,get_text)
var cursor_x = string_width(get_text)
if current_second mod 1
draw_line(cursor_x,room_height,cursor_x,room_height-16)
