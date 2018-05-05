///Draw_Elements()
var elements = ds_get(registry,"elements")
if is_zero(elements) return false

var get_list = ds_get(elements,"key list")
var get_size = ds_list_size(get_list)
//show("size of list is: " + string(get_size))

font_align(7)
for (var i = 0;i < get_size;i++)
    {
    //--------------//
    //              //
    //--------------//
    var get_element = ds_list_find_value(get_list,i)
    var get_element_type = ds_get(get_element,"type")
    
    switch get_element_type
        {
        case element.map:
            {
            Draw_Element_Map(get_element)
            break
            }
        case element.list:
            {
            Draw_Element_List(get_element)
            break
            }
        case element.inventory:
            {
            Draw_Element_Inventory(get_element)
            break
            }
        case element.shipyard:
            {
            Draw_Element_Shipyard(get_element)
            break
            }
        default:
            {
            show("No element drawing case for this yet!")
            break
            }
        }
        continue
    }
