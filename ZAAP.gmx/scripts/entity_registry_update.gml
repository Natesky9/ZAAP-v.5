///entity_list_update_position()
//this needs work
var selected_type = argument0
var selected_entity = argument1
var selected_variable = argument2


set("entity_registry_type_x1",100)
set("entity_registry_type_y1",100)
set("entity_registry_type_x2",200)
set("entity_registry_type_y2",100 + entity.types*32)


//planned is to be able to drag, resize, and filter entity types
