if not keyboard_check_pressed(vk_space)
exit

var get_ship = get_ship_from_socket(SSS)
if is_zero(get_ship) exit

packet_write(packet.fire_weapon)
