//create_new_grid(width,height)
//creates a new grid and returns the uuid
//of the map that has the grid

//create a uuid for it
var new_uuid = random_32();

var grid_map = create_grid();
grid_map[? "uuid"] = new_uuid;

var get_grid = ds_create(ds_type_grid,1,1);
grid_add_new_key(grid_map,"grid",get_grid)

return new_uuid
