var get_data_structure = argument0

if ds_exists(get_data_structure,ds_type_grid)
return ds_type_grid
if ds_exists(get_data_structure,ds_type_list)
return ds_type_list
if ds_exists(get_data_structure,ds_type_map)
return ds_type_map
if ds_exists(get_data_structure,ds_type_priority)
return ds_type_priority
if ds_exists(get_data_structure,ds_type_queue)
return ds_type_queue
if ds_exists(get_data_structure,ds_type_stack)
return ds_type_stack

return undefined
