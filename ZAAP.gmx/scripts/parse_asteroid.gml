///parse_asteroid(grid)
//when inputing a grid, outputs the seperated
//grids as arrays
//----------------------------------------//
var get_grid = argument0

var time = get_timer()

var get_width = ds_grid_width(get_grid)
var get_height = ds_grid_height(get_grid);

var grid_max = max(get_width,get_height)

show("grid is " + string(get_width) + " by " + string(get_height))

var checked_grid;
checked_grid[get_width-1,get_height-1] = 0;

var size = 0;
var test_size = 0;
var population = ds_list_create();
//population[get_width-1,get_height-1] = 0


var h,w,i,t
var remove
var remove_time = 0

//----------------------------------------//
//populate population with all cells
for (h = 0;h < get_height;h += 1)
    {
    for (w = 0;w < get_width;w += 1)
        {
        var get_cell = ds_grid_get(get_grid,w,h)
        
        if get_cell
            {
            //add to the list
            ds_list_add(population,w * grid_max + h)
            //population[size,0] = w
            //population[size,1] = h
            size++
            checked_grid[w,h] = 1
            continue
            }
        checked_grid[w,h] = 0
        }
    }
//show("size of asteroid is: " + string(size))
//show("asteroid cells are: " + string(population))
//show("checked grid is: " + string(checked_grid))
//done populating
//----------------------------------------//

//do this until all of the cells are claimed
//output is the final result of parsing
var output;
//temp is the placeholder array
var temp;
temp[get_width-1,get_height-1] = 0;
var temp_num;
//group 0 is the stats, groups 1 and up are the arrays for the groups
output_group = 1
while size
    {
    //show("checking group")
    //show("size of asteroid is: " + string(size))
    //remove this seed from population
    size--;
    var first = ds_list_find_value(population,0)
    ds_list_delete(population,0)
    var seed_x = floor(first/grid_max);
    var seed_y = first mod grid_max;
    //var seed_x = population[size,0];
    //var seed_y = population[size,1];
    
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
        //show("testing cell " + string(test_x) + ":" + string(test_y))
        
        for (var i = 1;i <= 6;i++)
            {
            //get the cell to test
            var coords = hex_direction_to_grid(i,test_x,test_y)
            var get_x = test_x + coords[0];
            var get_y = test_y + coords[1];
            
            
            //if it were to be out of grid
            if not grid_in_bounds(get_grid,get_width,get_height,get_x,get_y)
                {
                //this cell would be out of bounds
                continue
                }
            var is_free = checked_grid[get_x,get_y]
            
            if !is_free
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
            //remove this cell from the population
            remove = get_timer()
            var to_remove = ds_list_find_index(population,get_x * grid_max + get_y)
            ds_list_delete(population,to_remove)
            remove_time += get_timer() - remove
            
            /*
            //remove this cell from the population OLD
            remove = get_timer()
            for (t = 0;t < size;t++)
                {
                var t_x = population[t,0]
                var t_y = population[t,1]
                
                if t_x == get_x
                and t_y == get_y
                    {
                    //swap this with the end
                    //so that it can be erased
                    population[t,0] = population[size,0]
                    population[t,1] = population[size,1]
                    }
                }
            remove_time += get_timer() - remove
            */
            
            
            
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
show("remove time took: " + string(remove_time))
show("time to execute parse_asteroid: " + string(get_timer() - time))

ds_list_destroy(population)

return output
