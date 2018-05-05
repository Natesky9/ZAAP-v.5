///mouse_left_click_entity_registry()

if not show_entity_registry
return false
//early exit if the list isn't being drawn

var get_type = registry_type_from_mouse()
show("registry click was: " + string(get_type))


if not is_zero(get_type)
    {
    //get the current
    var current_entity_list = get("selected type")
    
    if get_type == current_entity_list
        {
        //the same list was clicked, close the list
        set("selected type",false)
        return true
        }
    
    //otherwise, set it to that
    set("selected type",get_type)
    return true
    }

//we're done here
show("done with entity registry")
return false
