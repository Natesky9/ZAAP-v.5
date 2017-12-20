///parse_asteroid(grid)
//when inputing a grid, outputs the seperated
//grids as arrays
//----------------------------------------//
var get_grid = argument0

var get_width = ds_grid_width(get_grid)
var get_height = ds_grid_height(get_grid);

show("grid is " + string(get_width) + " by " + string(get_height))

var checked_grid;
checked_grid[get_width-1,get_height-1] = 0;

var size = 0;
var test_size = 0;
result[0] = 0

//----------------------------------------//
//populate result with all cells
for (h = 0;h < get_height;h += 1)
    {
    for (w = 0;w < get_width;w += 1)
        {
        var get_cell = ds_grid_get(get_grid,w,h)
        
        if get_cell
            {
            //add to the list
            result[size,0] = w
            result[size,1] = h
            size++
            checked_grid[w,h] = 1
            continue
            }
        checked_grid[w,h] = 0
        }
    }
//show("size of asteroid is: " + string(size))
show("asteroid cells are: " + string(result))
//show("checked grid is: " + string(checked_grid))
//done populating result
//----------------------------------------//

//do this until all of the cells are claimed
//output is the final result of parsing
var output
//temp is the placeholder array
var temp
var temp_num
//group 0 is the stats, groups 1 and up are the arrays for the groups
output_group = 1
while size
    {
    show("checking group")
    show("size of asteroid is: " + string(size))
    //remove this seed from result
    size--;
    var seed_x = result[size,0];
    var seed_y = result[size,1];
    
    //put this in the temp
    temp_num = 0
    temp = 0
    temp[0,0] = seed_x
    temp[0,1] = seed_y
    
    //seed test with one cell
    test[0,0] = seed_x;
    test[0,1] = seed_y;
    test_size = 1;
    
    //fill the seed
    checked_grid[seed_x,seed_y] = 0
    //----------------------------------------//
    while test_size
        {
        test_size--
        var test_x = test[test_size,0]
        var test_y = test[test_size,1]
        show("testing cell " + string(test_x) + ":" + string(test_y))
        
        for (var i = 1;i <= 6;i++)
            {
            //get the cell to test
            var coords = hex_direction_to_grid(i,test_x,test_y)
            var get_x = test_x + coords[0];
            var get_y = test_y + coords[1];
            
            
            //if it were to be out of grid
            if not grid_in_bounds(get_grid,get_x,get_y)
                {
                //this cell would be out of bounds
                continue
                }
            var is_free = checked_grid[get_x,get_y]
            
            if not is_free
                {
                //this cell is empty, or has already been checked
                continue
                }
            
            
            //mark this as checked
            checked_grid[get_x,get_y] = 0
            
            //put this in the output
            temp_num++
            temp[temp_num,0] = get_x
            temp[temp_num,1] = get_y
            
            size--;
            //remove this cell from result
            for (var t = 0;t < size;t++)
                {
                var t_x = result[t,0]
                var t_y = result[t,1]
                
                if t_x == get_x
                and t_y == get_y
                    {
                    //swap this with the end
                    //so that it can be erased
                    result[t,0] = result[size,0]
                    result[t,1] = result[size,1]
                    }
                }
            
            //add this cell to the test
            test[test_size,0] = get_x
            test[test_size,1] = get_y
            test_size++
            //mark as checked
            }
        }
    output[0] = output_group
    output[output_group] = temp
    show("OUTPUT:" + string(output))
    output_group++
    }
//----------------------------------------//

return output
