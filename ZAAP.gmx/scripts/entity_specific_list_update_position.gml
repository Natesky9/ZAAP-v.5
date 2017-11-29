///entity_specific_list_update_position
//updates the location of the entity specific list
var get_list = argument0
var get_count = argument1
var entity_list_y1 = get("entity_list_y1")
var entity_list_x2 = get("entity_list_x2")

//align to the entity list
    {
    //set the left edge
    set("entity_specific_list_x1",entity_list_x2)
    //set the top edge
    set("entity_specific_list_y1",entity_list_y1)
    //set the right edge 100 units wide
    set("entity_specific_list_x2",entity_list_x2 + 100)
    //set the bottom edge 16 units per value
    set("entity_specific_list_y2",entity_list_y1 + get_count*16)
    }
//###//
//to be added, dragging, resizing?
