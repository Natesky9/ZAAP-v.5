///draw_registry_structure(x1,y1,x2,y2,selected_variable)
//draws the data structure of the selected variable,
//if it is one. If not, this exits
var structure_x1 = argument0
var structure_y1 = argument1
var structure_x2 = argument2
var structure_y2 = argument3
var selected_uuid = argument4
var selected_variable_index = argument5

var selected_entity = entity_from_uuid(selected_uuid)

if is_zero(selected_entity) exit
if is_zero(selected_variable_index) exit

var key_list = ds_get(selected_entity,"key list")
var selected_variable = ds_list_find_value(key_list,selected_variable_index-1)


switch selected_variable
    {
    //--------------------------------//
    case "inventory":
        {
        var get_list = ds_get(selected_entity,selected_variable)
        var get_size = ds_list_size(get_list)
        
        var structure_width = 100
        var structure_height = get_size * 16
        structure_x2 = structure_x1 + structure_width
        structure_y2 = structure_y1 + structure_height
        
        draw_set_color(c_aqua)
        draw_rectangle(structure_x1,structure_y1,structure_x2,structure_y2,false)
        draw_set_color(c_black)
        draw_rectangle(structure_x1,structure_y1,structure_x2,structure_y2,true)
        
        font_align(7)
        var i,get_value,text_y
        for (i = 0;i < get_size;i += 1)
            {
            get_value = ds_list_find_value(get_list,i)
            text_y = structure_y1 + i*16
            draw_text(structure_x1,text_y,string(get_value))
            }
        exit
        }
    case "grid":
        {
        var get_grid = ds_get(selected_entity,selected_variable)
        draw_registry_structure_grid(get_grid,structure_x1,structure_y1)
        exit
        }
    //--------------------------------//
    default:
        {
        //no structure to draw, exit
        exit
        }
    //--------------------------------//
    }


/*


switch selected_variable
        {
        //-----//
        case "inventory":
            {
            var get_inventory = ds_get(get_entity,"inventory")
            if is_zero(get_inventory)
                {
                show("no inventory!")
                break
                }
            var get_inventory_size = ds_list_size(get_inventory)
            
            var key_list_inventory_x1 = key_list_x2
            var key_list_inventory_y1 = key_list_y1
            var key_list_inventory_x2 = key_list_inventory_x1 + 100
            var key_list_inventory_y2 = key_list_inventory_y1 + get_inventory_size*16

            break
            }
        //-----//
        case "grid":
            {
            //draw the grid
            var get_grid = grid_from_entity(get_entity)

            draw_set_color(c_black)      
            font_align(7)
            draw_text(key_list_x1,key_list_y1 + 16*i,get_key)
            font_align(9)
            draw_text(key_list_x2,key_list_y1 + 16*i,"->")
            
            //draw the grid window
            var key_list_grid_x1 = key_list_x2
            var key_list_grid_y1 = key_list_y1
            var key_list_grid_x2 = key_list_grid_x1 + grid_width*ship_grid_size
            var key_list_grid_y2 = key_list_grid_y1 + grid_height*ship_grid_size
            draw_set_color(c_gray)
            draw_rectangle(key_list_grid_x1,key_list_grid_y1,key_list_grid_x2,key_list_grid_y2,false)
            draw_set_color(c_black)
            draw_rectangle(key_list_grid_x1,key_list_grid_y1,key_list_grid_x2,key_list_grid_y2,true)
            font_align(7)
            for (var w = 0;w < grid_width;w += 1)
                {
                for (var h = 0;h < grid_height;h += 1)
                    {
                    var get_grid_value = ds_grid_get(get_grid,w,h)
                    var g_x1 = key_list_grid_x1 + w * ship_grid_size
                    var g_y1 = key_list_grid_y1 + h * ship_grid_size
                    var g_x2 = g_x1 + ship_grid_size
                    var g_y2 = g_y1 + ship_grid_size
                    var grid_color = grid_value_to_color(get_grid_value)
                    if not is_zero(grid_color)
                        {
                        draw_set_color(grid_color)
                        draw_rectangle(g_x1,g_y1,g_x2,g_y2,false)
                        }
                    draw_set_color(c_black)
                    draw_text(g_x1,g_y1,string(get_grid_value))
                    }
                }
            //end drawing the grid window
            break
            }
        //-----//
        default:
            {
            get_value = ds_get(get_entity,get_key)
            
            font_align(7)
            draw_text(key_list_x1,key_list_y1 + 16*i,get_key)
            font_align(9)
            
            text = get_value
            if is_real(get_value)
            text = string(get_value)
            draw_text(key_list_x2,key_list_y1 + 16*i,text)
            }
        //-----//
        }
    }
*/
