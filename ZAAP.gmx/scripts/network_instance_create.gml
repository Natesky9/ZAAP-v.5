///network_instance_create()
//create all the data structures for the network



ini_open("server.ini")
console_add("creating server data")
//writing
ini_write_string("Server","timestamp",date_time_string(GM_build_date))
ini_write_string("Server","build",GM_version)

ini_write_string("sectors","sector1","none")
//done writing
var location = ini_close()
//console_add("location: " + string(location))

network_instance_create_entity_data()

