///ds_destroy(get_type,get_ds)
var get_type = argument0
var get_ds = argument1

if get_type == ds_type_map
    {
    var key_list = keys(get_ds)
    if key_list
        {
        ds_destroy(ds_type_list,key_list)
        }
    ds_map_destroy(get_ds)
    var pos = ds_list_find_index(dynamic_maps,get_ds)
    ds_list_delete(dynamic_maps,pos)
    exit
    }
if get_type == ds_type_list
    {
    ds_list_destroy(get_ds)
    var pos = ds_list_find_index(dynamic_lists,get_ds)
    ds_list_delete(dynamic_lists,pos)
    exit
    }
if get_type == ds_type_grid
    {
    ds_grid_destroy(get_ds)
    var pos = ds_list_find_index(dynamic_grids,get_ds)
    ds_list_delete(dynamic_grids,pos)
    }
