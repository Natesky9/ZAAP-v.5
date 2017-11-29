///keyboard_pressed_f5()

if not keyboard_check_pressed(vk_f5)
exit

if am_client()
or am_server()
exit

console_add("Username set to: " + keyboard_string)
set("username",keyboard_string)

keyboard_string = ""

