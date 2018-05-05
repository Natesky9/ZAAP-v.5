///get_ship_from_socket(socket)
//returns entity

//this gives me the entity map of the ship that the socket is controlling
var get_socket = argument0

var get_player = map_from_socket(get_socket)
//show("socket map: " + string(get_player))
if is_zero(get_player) return false

var get_uuid = ds_get(get_player,"ship")
//show("get_uuid: " + string(get_uuid))
if is_zero(get_uuid) return false

var entity_map = fetch_entity_map(entity.ship)
var get_ship = ds_get(entity_map,get_uuid)
//show("get ship: " + string(get_ship))
if is_zero(get_ship) return false

return get_ship
