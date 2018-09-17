///entity_registry_entity_update()
//updates the location of the entity specific list
var get_list = argument0
var get_count = argument1
var type_y1 = ds_get(envar,"entity_registry_type_y1")
var type_x2 = ds_get(envar,"entity_registry_type_x2")

//align to the entity list
    {
    //set the left edge
    ds_set(envar,"entity_registry_entity_x1",type_x2,key.value)
    //set the top edge
    ds_set(envar,"entity_registry_entity_y1",type_y1,key.value)
    //set the right edge 100 units wide
    ds_set(envar,"entity_registry_entity_x2",type_x2 + 100,key.value)
    //set the bottom edge 16 units per value
    ds_set(envar,"entity_registry_entity_y2",type_y1 + get_count*16,key.value)
    }
//###//
//to be added, dragging, resizing?
