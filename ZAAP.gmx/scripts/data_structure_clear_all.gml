///data_structure_clear_all()
//clear all network data structures

repeat ds_list_size(dynamic_lists)
    {
    var get_list = ds_list_find_value(dynamic_lists,0)
    show("destroying list: " + string(get_list))
    ds_list_destroy(get_list)
    ds_list_delete(dynamic_lists,0)
    }

repeat ds_list_size(dynamic_maps)
    {
    var get_map = ds_list_find_value(dynamic_maps,0)
    show("destroying map: " + string(get_map))
    ds_map_destroy(get_map)
    ds_list_delete(dynamic_maps,0)
    }

repeat ds_list_size(dynamic_grids)
    {
    var get_grid = ds_list_find_value(dynamic_grids,0)
    show("destroying grid: " + string(get_grid))
    ds_grid_destroy(get_grid)
    ds_list_delete(dynamic_grids,0)
    }
//--------------------------------//
for (var i = 0;i < ds_list_size(static_lists);i++)
    {
    var get_list = ds_list_find_value(static_lists,i)
    ds_list_clear(get_list)
    }
for (var i = 0;i < ds_list_size(static_maps);i++)
    {
    var get_map = ds_list_find_value(static_maps,i)
    var get_list = keys(get_map)
    ds_map_clear(get_map)
    ds_list_clear(get_list)
    ds_map_set(get_map,"key list",get_list)
    }

show("Cleared all network data")
