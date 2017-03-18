///font_align(numpad)

var numpad = argument0

if numpad < 1
or numpad > 9
or numpad mod 1 != 0
    {
    show("Error, number out of range")
    font_align(5)
    exit
    }


switch numpad mod 3
    {
    case 0:
        {draw_set_halign(fa_right);break}
    case 1:
        {draw_set_halign(fa_left);break}
    case 2:
        {draw_set_halign(fa_center);break}
    }
switch (numpad-1) div 3
    {
    case 0:
        {draw_set_valign(fa_bottom);break}
    case 1:
        {draw_set_valign(fa_middle);break}
    case 2:
        {draw_set_valign(fa_top);break}
    }
