///hex_neighbor(grid,x,y,dir)
//returns the value of the neigboring hex
var get_grid = argument0;
var get_grid_x = argument1;
var get_grid_y = argument2;
var get_dir = argument3;

var get_x = 0;
var get_y = 0;

switch get_dir
    {
    case dir.up:
        {
        get_y--
        break;
        }
    case dir.down:
        {
        get_y++
        break;
        }
    case dir.upleft:
        {
        get_x--
        if not (get_grid_x mod 2)
        get_y--
        break;
        }
    case dir.upright:
        {
        get_x++
        if not (get_grid_x mod 2)
        get_y--
        break;
        }
    case dir.downleft:
        {
        get_x--
        if (get_grid_x mod 2)
        get_y++
        break;
        }
    case dir.downright:
        {
        get_x++
        if (get_grid_x mod 2)
        get_y++
        break;
        }
    default:
        {
        show("error, hex_neighbor doesn't have a valid direction!")
        return false;
        }
    }
    var get_value = ds_grid_get(get_grid,get_grid_x + get_x, get_grid_y + get_y)
    
    //check if out of bounds
    if is_undefined(get_value)
    return false
    
    return get_value
