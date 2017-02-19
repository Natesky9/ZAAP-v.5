steps_since_game_started = 0
step_time = 0
draw_time = 0
draw_gui_time = 0

ds_map_create()
ds_list_create()
ds_grid_create(1,1)
ds_stack_create()
ds_queue_create()
ds_priority_create()

create_vertex_buffer_format()

game_server = -1
game_client = -1
IP = -1
SSS = -1

packets_in = 0
packets_out = 0
packet_bytes_in = 0
packet_bytes_out = 0

console_list = ds_list_create()
console_add("list is id of " + string(console_list))

bin = buffer_create(64,buffer_grow,1)
bout = buffer_create(64,buffer_grow,1)

data_structure_grid_list = ds_list_create()
data_structure_list_list = ds_list_create()
data_structure_map_list = ds_list_create()
data_structure_priority_list = ds_list_create()
data_structure_queue_list = ds_list_create()
data_structure_stack_list = ds_list_create()
data_structure_grid_amount = 0
data_structure_list_amount = 0
data_structure_map_amount = 0
data_structure_priority_amount = 0
data_structure_queue_amount = 0
data_structure_stack_amount = 0


debug_draw = false
show_debug_data_structures = false

//ping_timeout is also the automatic disconnect
ping_timeout = 180
network_set_config(network_config_connect_timeout,ping_timeout)

keyboard_string = "127.0.0.1"
keyboard_focus = "console"

ship_grid_size = 16

build = date_time_string(GM_build_date)
console_add("{" + build + "}")
