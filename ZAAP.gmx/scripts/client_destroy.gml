///client_destroy()

var get_client = ds_get(envar,"client")
network_destroy(get_client)
//reset stored variables
ds_set(envar,"client",-1,key.value)
ds_set(envar,"SSS",-1,key.value)

data_structure_clear_all()


//old disconnect
packet_write(packet.remove_socket)
ds_set(envar,"ship",0,key.value)
host_connection = -1
view_reset()
