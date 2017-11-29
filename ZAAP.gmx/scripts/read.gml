///read()
//read the buffer from bin
//will be string or integer

//ANYWHERE you use read(), you must use write()

//show("reading buffer")

var buffer_type = buffer_read(bin,buffer_u8)
//show("buffer type is: " + string(buffer_type))

var value = buffer_read(bin,buffer_type)
//show("value is: " + string(value))
//show("done reading buffer")
return value
