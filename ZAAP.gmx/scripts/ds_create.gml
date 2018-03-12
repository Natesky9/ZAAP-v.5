///ds_create(type,[grid x,grid y])

var get_type = argument[0]


switch get_type
    {
    case ds_type_grid:
        {
        var get_w = argument[1]
        var get_h = argument[2]
        var get_grid = ds_grid_create(get_w,get_h)
        ds_list_add(dynamic_grids,get_grid)
        //show("added grid: " + string(get_grid))
        return get_grid
        }
    case ds_type_list:
        {
        var get_list = ds_list_create()
        ds_list_add(dynamic_lists,get_list)
        //show("added list: " + string(get_list))
        return get_list
        }
    case ds_type_map:
        {
        var get_map = ds_map_create()
        ds_list_add(dynamic_maps,get_map)
        //show("added map: " + string(get_map))
        return get_map
        }
    case ds_type_priority:
        {
        //didn't need a case for this yet
        var get_priority = ds_priority_create()
        return get_priority
        }
    case ds_type_queue:
        {
        //didn't need a case for this yet
        var get_queue = ds_queue_create()
        return get_queue
        }
    case ds_type_stack:
        {
        //didn't need a case for this yet
        var get_stack = ds_stack_create()
        return get_stack
        }
    default:
        {
        show("I don't even know how you got here #ds_create")
        return false
        }
    }

