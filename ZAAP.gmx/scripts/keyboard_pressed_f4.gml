if not keyboard_check_pressed(vk_f4)
exit

show_debug = !show_debug
show_debug_overlay(show_debug)
console_add("Toggled debug overlay")

