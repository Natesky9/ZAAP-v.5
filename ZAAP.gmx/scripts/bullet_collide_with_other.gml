///bullet_collide_with_other(bullet_entity,bullet_uuid,collision_entity,collision_uuid)
var get_entity = argument0
var get_uuid = argument1
var collision_entity = argument2
var collision_uuid = argument3

//default event for a bullet colliding with another entity
packet_write(packet.entity_destroy,collision_uuid)
entity_destroy_basic(collision_uuid)

packet_write(packet.entity_destroy,get_uuid)
entity_destroy_basic(get_uuid)

