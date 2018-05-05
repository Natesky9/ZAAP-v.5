///Draw_Entity_Registry()

if not am_server()
and not am_client()
exit
//--------------------------------//
//draw the debug list
if show_entity_registry
    {
    entity_registry_update()
    var selected_type = get("selected type")
    var selected_uuid = get("selected entity")

    
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
    
    
    var text_y
    font_align(7)
    
    //--------------------------------//
    draw_registry_type(type_x1,type_y1,type_x2,type_y2,selected_type)
    //--------------------------------//
    }
//end list window    
//--------------------------------//
