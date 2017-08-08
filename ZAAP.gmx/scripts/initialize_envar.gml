///initialize_envar()
//create the "environment variables"
//this map is to allow uninitialized
//variables to be used. Basically,
//           I'm lazy             //

envar = ds_map_create();
ds_add_key_list(envar)
//server and client are special,
//in that -1 is actually "off"
//I'll probably fix that by
//adding one
ds_set(envar,"server",-1)
ds_set(envar,"client",-1)
//these aren't actually necessary,
//but I keep them around so I remember
ds_set(envar,"steps since start",0)
ds_set(envar,"step time",0)
ds_set(envar,"draw time",0)
ds_set(envar,"draw gui time",0)

ds_set(envar,"entity_list_x1",100)
ds_set(envar,"entity_list_y1",100)
ds_set(envar,"entity_specific_list_x1",0)
ds_set(envar,"entity_specific_list_y1",0)

ds_set(envar,"IP",-1)
ds_set(envar,"integer IP",-1)
ds_set(envar,"letter IP",-1)

//-----------------------------------//
//things that need to be put into envar

SSS = -1

packets_in = 0
packets_out = 0
packet_bytes_in = 0
packet_bytes_out = 0
