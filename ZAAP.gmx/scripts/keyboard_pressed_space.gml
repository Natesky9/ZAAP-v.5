///keyboard_pressed_space()

if not keyboard_check_pressed(vk_space)
or keyboard_focus == "console"
exit



if am_client()
    {
    //packet_fire_weapon
    packet_write(packet.fire_weapon)
    }
