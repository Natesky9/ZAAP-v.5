///data_structure_clear_all()
//clear all network data structures

repeat ds_list_size(data_structure_list_list)
    {
    var get_list = ds_list_find_value(data_structure_list_list,0)
    show("destroying list: " + string(get_list))
    ds_list_destroy(get_list)
    ds_list_delete(data_structure_list_list,0)
    data_structure_list_amount--
    }

repeat ds_list_size(data_structure_map_list)
    {
    var get_map = ds_list_find_value(data_structure_map_list,0)
    show("destroying map: " + string(get_map))
    ds_map_destroy(get_map)
    ds_list_delete(data_structure_map_list,0)
    data_structure_map_amount--
    }

repeat ds_list_size(data_structure_grid_list)
    {
    var get_grid = ds_list_find_value(data_structure_grid_list,0)
    show("destroying grid: " + string(get_grid))
    ds_grid_destroy(get_grid)
    ds_list_delete(data_structure_grid_list,0)
    data_structure_grid_amount--
    }

show("Cleared all network data")
