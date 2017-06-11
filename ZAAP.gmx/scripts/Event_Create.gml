///Event_Create()
//envar is the game map
//it replaces all local/global variables

envar = ds_map_create();
ds_add_key_list(envar)

ds_set(envar,"steps since start",0)
ds_set(envar,"step time",0)
ds_set(envar,"draw time",0)
ds_set(envar,"draw gui time",0)

ds_map_create()
ds_list_create()
ds_grid_create(1,1)
ds_stack_create()
ds_queue_create()
ds_priority_create()

create_vertex_buffer_format()

//these need to be initialized to -1
//0 is a valid value
ds_set(envar,"server",-1)
ds_set(envar,"client",-1)

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
show_debug_entity_list = false
show_debug_data_structures = false

//ping_timeout is also the automatic disconnect
ping_timeout = 180
network_set_config(network_config_connect_timeout,ping_timeout)

keyboard_string = "127.0.0.1"
keyboard_focus = "console"
entity_focus = 0

ship_grid_size = 16

Define_Data()
Define_Packets()
Define_Entities()


build = date_time_string(GM_build_date)
console_add("{" + build + "}")


ds_set(envar,"entity_list_x1",100)
ds_set(envar,"entity_list_y1",100)
ds_set(envar,"entity_specific_list_x1",0)
ds_set(envar,"entity_specific_list_y1",0)
