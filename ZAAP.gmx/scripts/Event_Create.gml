game_server = -1
game_client = -1
socket_list = ds_list_create()
console_list = ds_list_create()

bin = buffer_create(64,buffer_grow,1)
bout = buffer_create(64,buffer_grow,1)
