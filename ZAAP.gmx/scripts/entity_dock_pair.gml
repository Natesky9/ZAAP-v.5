///entity_dock_pair
//client side version of docking
//only sets the docked keys
//returns nothing

var get_uuid = argument0
var get_target = argument1

//get the ship entity
var get_entity = entity_from_uuid(get_uuid)
if is_zero(get_entity)
    {
    console_add("error at entity_dock!")
    console_add("entity does not exist!")
    exit
    }

//get the station entity
var get_target_entity = entity_from_uuid(get_target)
if is_zero(get_target_entity)
    {
    console_add("error at entity_dock!")
    console_add("target does not exist!")
    exit
    }

//dock both of them
ds_set(get_entity,"docked to",get_target)
ds_set(get_target_entity,"docked",get_uuid)
