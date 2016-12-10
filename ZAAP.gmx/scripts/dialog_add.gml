var text = argument0

var dialog_max = 6
var dialogs = ds_list_size(dialog_list)

ds_list_insert(dialog_list,0,text)

//cull extras
if dialogs > 6
ds_list_delete(dialog_list,dialogs)
