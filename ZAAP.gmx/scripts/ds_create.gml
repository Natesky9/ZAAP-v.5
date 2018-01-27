///ds_create(type,[grid x,grid y])

var get_type = argument[0]


switch get_type
    {
    case ds_type_grid:
        {
        data_structure_grid_amount++
        var get_w = argument[1]
        var get_h = argument[2]
        var get_grid = ds_grid_create(get_w,get_h)
        ds_list_add(data_structure_grid_list,get_grid)
        //show("added grid: " + string(get_grid))
        return get_grid
        }
    case ds_type_list:
        {
        data_structure_list_amount++
        var get_list = ds_list_create()
        ds_list_add(data_structure_list_list,get_list)
        //show("added list: " + string(get_list))
        return get_list
        }
    case ds_type_map:
        {
        data_structure_map_amount++
        var get_map = ds_map_create()
        ds_list_add(data_structure_map_list,get_map)
        //show("added map: " + string(get_map))
        return get_map
        }
    case ds_type_priority:
        {
        data_structure_priority_amount++
        var get_priority = ds_priority_create()
        ds_list_add(data_structure_priority_list,get_priority)
        return get_priority
        }
    case ds_type_queue:
        {
        data_structure_queue_amount++
        var get_queue = ds_queue_create()
        ds_list_add(data_structure_queue_list,get_queue)
        return get_queue
        }
    case ds_type_stack:
        {
        data_structure_stack_amount++
        var get_stack = ds_stack_create()
        ds_list_add(data_structure_stack_list,get_stack)
        return get_stack
        }
    default:
        {
        show("I don't even know how you got here #ds_create")
        return false
        }
    }

