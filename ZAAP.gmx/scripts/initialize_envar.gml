///initialize_envar()
//create the "environment variables"
//this map is to allow uninitialized
//variables to be used. Basically,
//           I'm lazy             //

envar = ds_construct(ds_type_map)
show("ENVAR map value is: " + string(envar))

set("static maps",static_maps)
set("static lists",static_lists)
set("static grids",static_grids)
set("dynamic maps",dynamic_maps)
set("dynamic lists",dynamic_lists)
set("dynamic grids",dynamic_grids)


//server and client are special,
//in that -1 is actually "off"
//I'll probably fix that by
//adding one
set("server",-1)
set("client",-1)
//these aren't actually necessary,
//but I keep them around so I remember
set("session time",0)
set("step time",0)
set("draw time",0)
set("draw gui time",0)



//shipyard gui
set("shipyard x1",500)
set("shipyard y1",500)
set("shipyard x2",700)
set("shipyard y2",700)

set("selected part",part.null)

set("IP",-1)
set("integer IP",-1)
set("letter IP",-1)
set("SSS",-1)

//-----------------------------------//
//things that need to be put into envar


packets_in = 0
packets_out = 0
packet_bytes_in = 0
packet_bytes_out = 0

return envar
