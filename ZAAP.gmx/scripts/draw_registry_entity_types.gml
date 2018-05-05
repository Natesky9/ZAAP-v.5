///draw_registry_entity_types()
//draw the registry entity types
//currently, is the first window
var type_x1 = argument0
var type_y1 = argument1
var type_x2 = argument2
var type_y2 = argument3
var selected_type = argument4

for (var i = 1;i <= entity.types;i += 1)
    {
    draw_set_color(c_white)
    //if i == selected_type
    //draw_set_color(c_gray)
    draw_rectangle(type_x1,type_y1+i*32-32,type_x2,type_y1+i*32,false)
    draw_set_color(c_black)
    draw_text(type_x1,type_y1+i*32-32,string(i))
    //get the name of the entity type
    var text = name_from_type(i)
    draw_text(type_x1 + 20,type_y1+i*32-32,text)
    }
