///mouse_left_click_entity_registry()

if not show_entity_registry
return false
//early exit if the list isn't being drawn

var get_type = registry_type_from_mouse()
show("registry click was: " + string(get_type))


if not is_zero(get_type)
    {
    //clear the selected entity regardless
    set("selected entity",false)
    set("selected variable",false)
    set("selected structure",false)
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

//test if the entity specific list was clicked
var get_uuid = registry_uuid_from_mouse()

if not is_zero(get_uuid)
    {
    set("selected variable",false)
    set("selected structure",false)
    //grab the current
    var current_entity = get("selected entity")
    
    if get_uuid == current_entity
        {
        //the same list was clicked, close the list
        set("selected entity",false)
        return true
        }
    
    //otherwise, set it to that
    
    set("selected entity",get_uuid)
    return true
    }

//something something variables
var get_variable = registry_variable_from_mouse()
if not is_zero(get_variable)
    {
    set("selected structure",false)
    show("clicked on variable position: " + string(get_variable))
    var get_uuid = get("selected entity")
    if is_zero(get_uuid)
    return false
    
    var current_variable = get("selected variable")
    
    if get_variable == current_variable
        {
        //the same list was clicked, close the list
        set("selected variable",false)
        return true
        }
    
    set("selected variable",get_variable)
    return true
    }
//end variables


//we're done here
return false
