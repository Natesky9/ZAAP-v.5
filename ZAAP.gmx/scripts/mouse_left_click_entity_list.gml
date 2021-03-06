///mouse_left_click_entity_list()

if not show_entity_registry
return false//early exit if the list isn't being drawn

var get_entity_list = entity_list_index_from_mouse()

if not is_zero(get_entity_list)
    {
    //if the entity list was clicked
    show("mouse clicked on position: " + string(get_entity_list))
    //clear the selected entity regardless
    set("selected entity",false)
    //get the current
    var current_entity_list = get("selected type")
    
    if get_entity_list == current_entity_list
        {
        //the same list was clicked, close the list
        set("selected type",false)
        return true
        }
    
    //otherwise, set it to that
    set("selected type",get_entity_list)
    return true
    }

//test if the entity specific list was clicked
var get_entity = entity_index_from_mouse()

if not is_zero(get_entity)
    {
    //grab the current
    var current_entity = get("selected entity")
    
    if get_entity == current_entity
        {
        //the same list was clicked, close the list
        set("selected entity",false)
        return true
        }
    
    //otherwise, set it to that
    
    set("selected entity",get_entity)
    return true
    }

//something something variables
//end variables


//we're done here
return false
