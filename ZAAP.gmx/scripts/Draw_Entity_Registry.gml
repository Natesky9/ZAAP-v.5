///Draw_Entity_Registry()

if not am_server()
and not am_client()
exit
//--------------------------------//
//draw the debug list
if show_entity_registry
    {
    var selected_type = get("selected type")
    var selected_uuid = get("selected entity")
    var selected_variable = get("selected variable")
    
    entity_registry_update(selected_type,selected_uuid,selected_variable)
    
    var amount_types = entity.types
    var types_width = 100
    var types_height = amount_types * 64
    //entity types box
    var type_x1 = get("entity_registry_type_x1")
    var type_y1 = get("entity_registry_type_y1")
    var type_x2 = get("entity_registry_type_x2")
    var type_y2 = get("entity_registry_type_y2")
    set("entity_registry_type_x1",type_x1)
    set("entity_registry_type_y1",type_y1)
    set("entity_registry_type_x2",type_x2)
    set("entity_registry_type_y2",type_y2)
    //end types box
    
    if selected_type
        {
        get_list = entity_list(selected_type)
        var amount_entities = ds_list_size(get_list)
        var entities_width = 100
        var entities_height = amount_entities * 16
        //entity entities box
        var entity_x1 = type_x2//get("entity_registry_entity_x1")
        var entity_y1 = type_y1//get("entity_registry_entity_y1")
        var entity_x2 = entity_x1 + entities_width//get("entity_registry_entity_x2")
        var entity_y2 = entity_y1 + entities_height//get("entity_registry_entity_y2")
        set("entity_registry_entity_x1",entity_x1)
        set("entity_registry_entity_y1",entity_y1)
        set("entity_registry_entity_x2",entity_x2)
        set("entity_registry_entity_y2",entity_y2)
        //end entities box
        }
    if selected_uuid
        {
        var get_entity = entity_from_uuid(selected_uuid)
        get_list = ds_get(get_entity,"key list")
        var amount_variables = ds_list_size(get_list)
        var variables_width = 200
        var variables_height = amount_variables*16
        //entity variables box
        var variable_x1 = entity_x2//get("entity_registry_variable_x1")
        var variable_y1 = entity_y1//get("entity_registry_variable_y1")
        var variable_x2 = variable_x1 + variables_width//get("entity_registry_variable_x2")
        var variable_y2 = variable_y1 + variables_height//get("entity_registry_variable_y2")
        set("entity_registry_variable_x1",variable_x1)
        set("entity_registry_variable_y1",variable_y1)
        set("entity_registry_variable_x2",variable_x2)
        set("entity_registry_variable_y2",variable_y2)
        //end variables box
        }
    if selected_variable
        {
        //entity structures box
        var structure_x1 = variable_x2
        var structure_y1 = variable_y1
        //redundant, since this is handled in the script
        var structure_x2 = 0//get("entity_registry_structure_x2")
        var structure_y2 = 0//get("entity_registry_structure_y2")
        //end structures box
        }
    
    
    var text_y
    font_align(7)
    
    //--------------------------------//
    draw_registry_type(type_x1,type_y1,type_x2,type_y2,selected_type)
    //--------------------------------//
    if selected_type
    draw_registry_entity(entity_x1,entity_y1,entity_x2,entity_y2,selected_type,selected_uuid)
    //--------------------------------//
    if selected_uuid
    draw_registry_variable(variable_x1,variable_y1,variable_x2,variable_y2,selected_uuid,selected_variable)
    //--------------------------------//
    if selected_variable
    draw_registry_structure(structure_x1,structure_y1,structure_x2,structure_y2,selected_uuid,selected_variable)

    //end variable window
    //--------------------------------//
    }
//end list window    
//--------------------------------//
