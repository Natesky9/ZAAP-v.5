if not keyboard_check_pressed(vk_f4)
exit

debug_draw = !debug_draw
show_debug_overlay(debug_draw)
console_add("Toggled debug overlay")

