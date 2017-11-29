///Event_Create()
//Game Start Event

initialize_ds()
initialize_envar()

Define_Data()
Define_Packets()
Define_Entities()




create_vertex_buffer_format()




console_list = ds_list_create()
console_add("list is id of " + string(console_list))

bin = buffer_create(64,buffer_grow,1)
bout = buffer_create(64,buffer_grow,1)




debug_draw = false
show_debug_entity_list = false
show_debug_data_structures = false

//ping_timeout is also the automatic disconnect
ping_timeout = 180
network_set_config(network_config_connect_timeout,ping_timeout)

keyboard_string = "127.0.0.1"
keyboard_focus = "console"


ship_grid_size = 32




//build = date_time_string(GM_build_date)
//console_add("{" + build + "}")


set("entity view",false)
