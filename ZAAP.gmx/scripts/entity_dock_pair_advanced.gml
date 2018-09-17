///entity_dock_pair(uuid,target)
//pairs a ship and a shipyard
//checks for existing dock
//return true if passed
//return false is failed
console_add("beginning docking procedure")

var get_uuid = argument0
var get_target = argument1

//get the ship entity
var get_entity = entity_from_uuid(get_uuid)
if is_zero(get_entity) return false

console_add("test 1")

//get the station entity
var get_target_entity = entity_from_uuid(get_target)
if is_zero(get_target_entity) return false

console_add("test 2")

//get the docked status of both
var get_entity_docked = ds_get(get_entity,"docked")
var get_target_docked_to = ds_get(get_target_entity,"docked")

//if either are docked, failed
if get_entity_docked
or get_target_docked_to
return false

console_add("test 3")
//if both are free, dock both of them
ds_set(get_entity,"docked",get_target,key.value)
ds_set(get_target_entity,"docked",get_uuid,key.value)
return true
