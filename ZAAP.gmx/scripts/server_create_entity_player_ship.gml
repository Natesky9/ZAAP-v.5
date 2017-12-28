///server_create_entity_player_ship(get_socket,get_x,get_y,heading)
var get_socket = argument0
var get_x = argument1
var get_y = argument2

var get_uuid = entity_create_server(get_x,get_y,entity.ship)
//set the grid
var basic_grid = ds_create(ds_type_grid,9,9);
basic_grid[# 4,4] = true
basic_grid[# 4,3] = 2
basic_grid[# 3,4] = 3
basic_grid[# 5,4] = 3
var get_entity = entity_from_uuid(get_uuid)
ds_set(get_entity,"grid",basic_grid)
//end setting the grid

var get_socket_map = map_from_socket(get_socket)
ds_set(get_socket_map,"ship",get_uuid)

//packet_entity_create
packet_write(packet.entity_create,get_uuid)
//packet_entity_command
packet_write(packet.entity_command,get_socket,get_uuid)

/*repeat 4
    {
    var get_enemy_uuid = summon_random_target(get_uuid)
    //packet_set_ownership
    packet_write(packet.set_ownership,get_socket,get_enemy_uuid)
    show("assigning player enemies")
    }
*/
