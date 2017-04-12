var get_map = argument0

var key_list_exists = ds_get(get_map,"key list")

if key_list_exists
    {
    show("ERROR, tried to create a key list when one already exists")
    exit
    }
if not key_list_exists
    {
    var key_list = ds_list_create();
    ds_set(environment_map,"key list",key_list);
    }
