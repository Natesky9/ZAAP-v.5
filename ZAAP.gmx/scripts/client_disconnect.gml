///client_disconnect
packet_write(packet.remove_socket)
data_structure_clear_all()
var get_client = get("client")
network_destroy(get_client)
set("client",-1)
set("SSS",-1)
set("ship",0)
host_connection = -1
view_reset()
