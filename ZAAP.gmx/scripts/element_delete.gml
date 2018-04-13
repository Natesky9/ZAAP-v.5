///element_delete(element)
var get_element = argument0

var elements = ds_get(registry,"elements")

show("get element is: " + string(get_element))
ds_destroy(ds_type_map,get_element)
ds_delete(elements,get_element)
/*
var element_key_list = ds_get(get_element,"key list")
ds_map_destroy(get_element)
ds_list_destroy(element_key_list)
*/
//done deleting the element

