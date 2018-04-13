///ds_construct(type)

var get_type = argument0

switch get_type
    {
    case ds_type_map:
        {
        var new_map = ds_map_create();
        //add to static
        ds_list_add(static_maps,new_map)
        //construct a key list
        var new_list = ds_construct(ds_type_list)
        ds_map_set(new_map,"key list",new_list)
        return new_map
        }
    case ds_type_list:
        {
        var new_list = ds_list_create();
        //add to static
        ds_list_add(static_lists,new_list)
        return new_list
        }
    default:
        {
        show("you don't have a case for this yet!")
        show("#ds_construct with type of: " + string(get_type))
        return false
        }
    }
