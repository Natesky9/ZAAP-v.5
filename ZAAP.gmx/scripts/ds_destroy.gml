///ds_destroy(get_type,get_ds)
var get_type = argument0
var get_ds = argument1

if get_type == ds_type_map
    {
    ds_map_destroy(get_ds)
    data_structure_map_amount--
    var pos = ds_list_find_index(data_structure_map_list,get_ds)
    ds_list_delete(data_structure_map_list,pos)
    exit
    }
if get_type == ds_type_list
    {
    ds_list_destroy(get_ds)
    data_structure_list_amount--
    var pos = ds_list_find_index(data_structure_list_list,get_ds)
    ds_list_delete(data_structure_list_list,pos)
    exit
    }
if get_type == ds_type_grid
    {
    ds_grid_destroy(get_ds)
    data_structure_grid_amount--
    var pos = ds_list_find_index(data_structure_grid_list,get_ds)
    ds_list_delete(data_structure_grid_list,pos)
    }
