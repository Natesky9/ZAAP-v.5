///client_connect(ip,port)

var ip = argument0
var port = argument1

host_connection = network_connect(game_client,ip,port)

if host_connection < 0
console_add("Client failed to connect")
console_add(string(host_connection))

return host_connection
