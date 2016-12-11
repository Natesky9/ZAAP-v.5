var text = argument0

var console_max = 6
var console_messages = ds_list_size(console_list)

ds_list_insert(console_list,0,text)

//cull extras
if console_messages > 6
ds_list_delete(console_list,console_messages)
