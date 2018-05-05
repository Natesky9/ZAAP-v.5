///Event_Create()
//Game Start Event
Define_Data()
Define_Packets()
Define_Entities()

initialize_ds()
initialize_envar()
initialize_entity_map()
initialize_sockets()
initialize_dimensions()
initialize_registry()

var elements = ds_create(data.static,element.map)
ds_set(registry,"elements",elements)
ds_set(registry,"registry",registry)
//add to the list
//element_add(100,100,element.map,"registry",registry)
//element_add(400,200,element.map,"envar",envar)





create_vertex_buffer_format()




console_list = ds_create(data.static,ds_type_list)
console_add("list is id of " + string(console_list))

bin = buffer_create(64,buffer_grow,1)
bout = buffer_create(64,buffer_grow,1)




debug_draw = false
show_debug_data_structures = false

//ping_timeout is also the automatic disconnect
ping_timeout = 180
network_set_config(network_config_connect_timeout,ping_timeout*2)

keyboard_string = "127.0.0.1"
keyboard_focus = "console"


ship_grid_size = 32
rock_grid_size = 32

//build = date_time_string(GM_build_date)
//console_add("{" + build + "}")


set("entity view",false)
