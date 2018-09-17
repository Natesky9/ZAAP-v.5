///initialize_envar()
//create the "environment variables"
//this map is to allow uninitialized
//variables to be used. Basically,
//           I'm lazy             //

envar = ds_create(data.permanent,ds_type_map)
show("ENVAR map value is: " + string(envar))




//server and client are special,
//in that -1 is actually "off"
//I'll probably fix that by
//adding one
ds_set(envar,"server",0,key.value)
ds_set(envar,"client",0,key.value)
//these aren't actually necessary,
//but I keep them around so I remember
ds_set(envar,"session time",0,key.value)
ds_set(envar,"session time",0,key.value)
ds_set(envar,"step time",0,key.value)
ds_set(envar,"draw time",0,key.value)
ds_set(envar,"draw gui time",0,key.value)

ds_set(envar,"selected part",part.null,key.value)

ds_set(envar,"IP",-1,key.value)
ds_set(envar,"integer IP",-1,key.value)
ds_set(envar,"letter IP",-1,key.value)
ds_set(envar,"SSS",-1,key.value)

//-----------------------------------//
//things that need to be put into envar


packets_in = 0
packets_out = 0
packet_bytes_in = 0
packet_bytes_out = 0

return envar
