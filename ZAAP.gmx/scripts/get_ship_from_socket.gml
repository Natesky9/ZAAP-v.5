//this gives me the entity map of the ship that the socket is controlling
var get_socket = argument0

var get_socket_map = map_from_socket(get_socket)
if is_zero(get_socket_map) return false
var get_uuid = ds_get(get_socket_map,"ship")
if is_zero(get_uuid) return false
var get_ship = ds_get(entity_map,get_uuid)
if is_zero(get_ship) return false

return get_ship
