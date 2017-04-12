///Draw_Console()

///change this to use a surface instead

var get_text
var is_focused = (keyboard_focus == "console")

//add in console map

var console_messages = ds_list_size(console_list)

var view_height = view_hview[0]

//draw the box
var x1 = 0
var y1 = view_height- is_focused*16 -16*console_messages
var x2 = 240
var y2 = view_height

draw_set_color(c_gray)
draw_rectangle(x1,y1,x2,y2,false)
draw_set_color(c_black)
draw_rectangle(x1,y1,x2,y2,true)
if is_focused
draw_line(0,view_height-16,240,view_height-16)

//draw the texts
draw_set_color(c_black)
font_align(1)
for (var i = 0;i < console_messages;i += 1)
    {
    var text = ds_list_find_value(console_list,i)
    var text_x = 0
    var text_y = (view_height- is_focused*16 -16*i)
    draw_text(text_x,text_y,text)
    }

//draw the cursor and the typed text
if keyboard_focus == "console"
    {
    get_text = keyboard_string
    
    draw_text(0,view_height,get_text)
    if keyboard_focus == "console"
    and ((ds_get(environment_map,"steps since start") mod 10) < 5)
        {
        var cursor_x = string_width(get_text)
        draw_rectangle(cursor_x,view_height,cursor_x+2,view_height-16,false)
        }
    }
//end drawing the cursor
