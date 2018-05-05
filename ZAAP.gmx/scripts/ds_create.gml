///ds_create(data type,structure type,[grid x,grid y])
//creates a data structure
//of the specified data type data.(permanent/static/dynamic)
//of the specified structure ds_type_(map/list/grid)

var get_data_type = argument[0]
var get_type = argument[1]


switch get_type
    {
    //------------------------------------------------//
    case ds_type_grid:
        {
        var get_w = argument[2]
        var get_h = argument[3]
        var get_grid = ds_grid_create(get_w,get_h)
        switch get_data_type
            {
            case data.permanent:
                ds_list_add(permanent_grids,get_grid)
                break
            case data.static:
                ds_list_add(static_grids,get_grid)
                break
            case data.dynamic:
                ds_list_add(dynamic_grids,get_grid)
                break
            }
        //show("added grid: " + string(get_grid))
        return get_grid
        }
    //------------------------------------------------//
    case ds_type_list:
        {
        var get_list = ds_list_create()
        switch get_data_type
            {
            case data.permanent:
                ds_list_add(permanent_lists,get_list)
                break
            case data.static:
                ds_list_add(static_lists,get_list)
                break
            case data.dynamic:
                ds_list_add(dynamic_lists,get_list)
                break
            }
        //show("added list: " + string(get_list))
        return get_list
        }
    //------------------------------------------------//
    case ds_type_map:
        {
        var get_map = ds_map_create()
        var get_list = ds_list_create()
        switch get_data_type
            {
            case data.permanent:
                ds_list_add(permanent_maps,get_map)
                ds_list_add(permanent_lists,get_list)
                break
            case data.static:
                ds_list_add(static_maps,get_map)
                ds_list_add(static_lists,get_list)
                break
            case data.dynamic:
                ds_list_add(dynamic_maps,get_map)
                ds_list_add(dynamic_lists,get_list)
                break
            }
        //show("added map: " + string(get_map))
        ds_map_set(get_map,"key list",get_list)
        return get_map
        }
    //------------------------------------------------//
    default:
        {
        show("I don't even know how you got here #ds_create")
        return false
        }
    //------------------------------------------------//
    }

