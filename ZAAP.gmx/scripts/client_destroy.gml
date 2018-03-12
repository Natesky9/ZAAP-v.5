///client_destroy()

var get_client = get("client")
network_destroy(get_client)
//reset stored variables
set("client",-1)
set("SSS",-1)

data_structure_clear_all()
