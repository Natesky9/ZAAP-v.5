///string_argument_get("string",seperator,index)

///string_start
var str = argument0;
var sep = argument1;
var ind = argument2;
var len = string_length(sep)-1;
repeat (ind) str = string_delete(str,1,string_pos(sep,str)+len);
str = string_delete(str,string_pos(sep,str),string_length(str));
return str;
