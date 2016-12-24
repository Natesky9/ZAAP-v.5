game_server = -1
game_client = -1
socket_list = ds_list_create()
console_list = ds_list_create()

bin = buffer_create(64,buffer_grow,1)
bout = buffer_create(64,buffer_grow,1)


entity_list = ds_list_create()

show_debug = false

network_set_config(network_config_connect_timeout,1000)

keyboard_string = "75.89.16.217"
