var get_uuid = argument0
var get_damage = argument1
var get_entity = entity_from_uuid(get_uuid)

var get_health = ds_get(get_entity,"health")
var get_new_health = get_health - get_damage
ds_set(get_entity,"health",get_new_health)

return get_new_health
