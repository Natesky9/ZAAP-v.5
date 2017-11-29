///playerdata_create()
var username = argument0
//creates the playerdata file

ini_open(working_directory + "\players\" + " " + username + ".dat")
ini_write_string("data","name","test subject 1")
ini_write_real("data","x",0)
ini_write_real("data","x",0)

ini_write_real("currency","bits",0)
ini_write_real("currency","bytes",0)

ini_write_real("standing","them",0)

var location = ini_close()
show("stored player location at: " + location)
