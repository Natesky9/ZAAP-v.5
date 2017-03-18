///keyboard_pressed_space()

if not keyboard_check_pressed(vk_space)
or keyboard_focus == "console"
exit



var get_ship = get_ship_from_socket(SSS)
if is_zero(get_ship) exit

packet_write(packet.fire_weapon)
