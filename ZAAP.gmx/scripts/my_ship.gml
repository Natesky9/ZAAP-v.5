///my_ship()
//the client's controlled ship
//returns entity

var get_socket = ds_get(envar,"SSS")
var get_entity = ship_from_socket(get_socket)

return get_entity
