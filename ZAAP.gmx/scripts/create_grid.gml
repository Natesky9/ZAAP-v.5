//this gets called on both client and server
//to create a grid and fill in it's information

//create the map value for the grid
var get_grid = ds_create(ds_type_map)

//create the key list to store it's keys
var key_list = ds_create(ds_type_list);
get_grid[? "key list"] = key_list

//we're done here
return get_grid
