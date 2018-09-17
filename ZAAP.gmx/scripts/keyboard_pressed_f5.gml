///keyboard_pressed_f5()

if not keyboard_check_pressed(vk_f5)
exit

if am_client()
or am_server()
exit

console_add("Username set to: " + keyboard_string)
ds_set(envar,"username",keyboard_string,key.text)

keyboard_string = ""

