///Draw_Entity_Registry()
//###//
//soon to be replaced with a proper element
//###//

if not am_server()
and not am_client()
exit
//--------------------------------//
//draw the debug list
if show_entity_registry
    {
    entity_registry_update()
    var selected_type = ds_get(envar,"selected type")
    var selected_uuid = ds_get(envar,"selected entity")

    
    var amount_types = entity.types
    var types_width = 100
    var types_height = amount_types * 64
    //entity types box
    var type_x1 = ds_get(envar,"entity_registry_type_x1")
    var type_y1 = ds_get(envar,"entity_registry_type_y1")
    var type_x2 = ds_get(envar,"entity_registry_type_x2")
    var type_y2 = ds_get(envar,"entity_registry_type_y2")
    ds_set(envar,"entity_registry_type_x1",type_x1,key.value)
    ds_set(envar,"entity_registry_type_y1",type_y1,key.value)
    ds_set(envar,"entity_registry_type_x2",type_x2,key.value)
    ds_set(envar,"entity_registry_type_y2",type_y2,key.value)
    //end types box
    
    
    var text_y
    font_align(7)
    
    //--------------------------------//
    draw_registry_type(type_x1,type_y1,type_x2,type_y2,selected_type)
    //--------------------------------//
    }
//end list window    
//--------------------------------//
