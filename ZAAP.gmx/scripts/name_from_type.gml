///name_from_type
//returns the string name
//given the entity id

var get_type = argument0

var name = localized_entity_name[? get_type]

if is_string(name)
return name

else
return "null"
