///client_connect(ip,port)

var ip = argument0
var port = argument1

var get_client = ds_get(envar,"client")
host_connection = network_connect(get_client,ip,port)

if host_connection < 0
console_add("Client failed to connect")
console_add(string(host_connection))

return host_connection
