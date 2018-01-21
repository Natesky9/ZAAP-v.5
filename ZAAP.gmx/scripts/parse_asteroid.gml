///parse_asteroid(grid)
//when inputing a grid, outputs the seperated
//grids as arrays
//----------------------------------------//
var time = get_timer()
var get_entity,check_continuity,get_break_x,get_break_y,get_grid,
    get_width,get_height,grid_max,size,test_size,coords,get_x,get_y,
    first_neighbor,test_neighbor,first_side,second_side,size_of_checked,
    size_of_neighbors,h,w,i,t,j,get_cell,int_cell,result,temp,temp_num,
    first,seed_x,seed_y,test_x,test_y,is_free,to_remove,chunks,get_value,
    cells,chunk,new_uuid,new_entity,new_grid,get_cell_x,get_cell_y,checked_grid,
//----------------------------------//
var population = ds_list_create();
var neighbors = ds_list_create();
var to_check = ds_list_create()
var has_checked = ds_list_create()
//----------------------------------//
get_entity = argument[0]
//--------------------//
check_continuity = argument_count == 3

if check_continuity
    {
    //show("continuity is on")
    get_break_x = argument[1]
    get_break_y = argument[2]
    //for continuity shortcut
    }

get_grid = ds_get(get_entity,"grid")


get_width = ds_grid_width(get_grid)
get_height = ds_grid_height(get_grid);

grid_max = max(get_width,get_height)

//show("grid is " + string(get_width) + " by " + string(get_height))

checked_grid[get_width-1,get_height-1] = 0;

size = 0;
test_size = 0;
//population[get_width-1,get_height-1] = 0

//
//early exit check
if check_continuity
    {
    for (i = 1;i <= 6;i++)
        {
        //get the cell to test
        coords = hex_direction_to_grid(i,get_break_x,get_break_y)
        get_x = get_break_x + coords[0];
        get_y = get_break_y + coords[1];
        //show("testing cell: " + string(get_x) + ":" + string(get_y))
        if ds_grid_get(get_grid,get_x,get_y)
            {
            ds_list_add(neighbors,i)
            }
        }
    //now we have the list of immediately adjacent cells,
    //we test for continuity
    first_neighbor = ds_list_find_value(neighbors,0)
    ds_list_add(to_check,first_neighbor)
    ds_list_add(has_checked,first_neighbor)
    //ds_list_delete(neighbors,0)
    
    while ds_list_size(to_check)
        {
        //do this untill we run out of to_check
        test_neighbor = ds_list_find_value(to_check,0)
        ds_list_delete(to_check,0)
        
        //first side
        first_side = ((test_neighbor - 1 - 1 + 6) mod 6) + 1
        coords = hex_direction_to_grid(first_side,get_break_x,get_break_y)
        get_x = get_break_x + coords[0];
        get_y = get_break_y + coords[1];
        if ds_grid_get(get_grid,get_x,get_y)
        and ds_list_find_index(has_checked,first_side) == -1
            {
            //show("adding: " + string(first_side))
            ds_list_add(to_check,first_side)
            ds_list_add(has_checked,first_side)
            }
        //second side
        second_side = ((test_neighbor - 1 + 1) mod 6 ) + 1
        coords = hex_direction_to_grid(second_side,get_break_x,get_break_y)
        get_x = get_break_x + coords[0];
        get_y = get_break_y + coords[1];
        if ds_grid_get(get_grid,get_x,get_y)
        and ds_list_find_index(has_checked,second_side) == -1
            {
            //show("adding: " + string(second_side))
            ds_list_add(to_check,second_side)
            ds_list_add(has_checked,second_side)
            }
        }
    //done doing the loop
    size_of_checked = ds_list_size(has_checked);
    size_of_neighbors = ds_list_size(neighbors);
    //show("size of both checked and neighbors:")
    //show(string(size_of_checked))
    //show(string(size_of_neighbors))
    //show("------")
    
    if size_of_checked == size_of_neighbors
        {
        show("Grid is continuous, no need to continue parsing!")
        ds_list_destroy(population)
        ds_list_destroy(neighbors)
        ds_list_destroy(to_check)
        ds_list_destroy(has_checked)
        
        show("time to execute parse_asteroid: " + string(get_timer() - time))
        exit
        }
    }
//



//----------------------------------------//
//populate population with all cells
for (h = 0;h < get_height;h += 1)
    {
    for (w = 0;w < get_width;w += 1)
        {
        get_cell = ds_grid_get(get_grid,w,h)
        
        if get_cell
            {
            //add to the list
            int_cell = coord_to_int(w,h,grid_max)
            ds_list_add(population,int_cell)
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
//result is the final result of parsing
//odd that I have to define this, but what can you do
result[0,0] = 0

temp[get_width-1,get_height-1] = 0;

//group 0 is the stats, groups 1 and up are the arrays for the groups
output_group = 1
while size
    {
    //show("checking group")
    //show("size of asteroid is: " + string(size))
    //remove this seed from population
    size--;
    first = ds_list_find_value(population,0)
    ds_list_delete(population,0)
    seed_x = int_to_coord_x(first,grid_max);
    seed_y = int_to_coord_y(first,grid_max);
    //seed_x = population[size,0];
    //seed_y = population[size,1];
    
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
        test_x = test[test_size,0]
        test_y = test[test_size,1]
        //show("testing cell " + string(test_x) + ":" + string(test_y))
        
        for (i = 1;i <= 6;i++)
            {
            //get the cell to test
            coords = hex_direction_to_grid(i,test_x,test_y)
            get_x = test_x + coords[0];
            get_y = test_y + coords[1];
            
            
            //if it were to be out of grid
            if not grid_in_bounds(get_width,get_height,get_x,get_y)
                {
                //this cell would be out of bounds
                continue
                }
            is_free = checked_grid[get_x,get_y]
            
            if !is_free
                {
                //this cell is empty, or has already been checked
                continue
                }
            
            
            //mark this as checked
            checked_grid[get_x,get_y] = 0
            
            //put this in the result
            temp_num++
            temp[temp_num,0] = get_x
            temp[temp_num,1] = get_y
            
            size--;
            //remove this cell from the population
            to_remove = ds_list_find_index(population,get_x * grid_max + get_y)
            ds_list_delete(population,to_remove)
            
            /*
            //remove this cell from the population OLD
            remove = get_timer()
            for (t = 0;t < size;t++)
                {
                test_x = population[t,0]
                test_y = population[t,1]
                
                if test_x == get_x
                and test_y == get_y
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
    result[0,0] = output_group
    result[output_group,0] = temp
    
    //write how many were in this group at [0,i]
    //show("rock size is: " + string(temp_num))
    result[0,output_group] = temp_num + 1
    
    output_group++
    }
//----------------------------------------//

ds_list_destroy(population)
//show("-----")
//show(string(result))
//show("-----")

//--------------------------------------------------------//
//Part 2
//--------------------------------------------------------//
//second part of parse_asteroid

chunks = result[0,0]
//show("number of chunks: " + string(chunks))

if chunks == 1
    {
    ds_list_destroy(population)
    ds_list_destroy(neighbors)
    ds_list_destroy(to_check)
    ds_list_destroy(has_checked)
    
    show("time to execute parse_asteroid: " + string(get_timer() - time))
    exit
    }

get_x = ds_get(get_entity,"x")
get_y = ds_get(get_entity,"y")

for (i = 2;i <= chunks;i++)
    {
    cells = result[0,i]
    //show("cells in chunk " + string(i) + ": " + string(cells))
    chunk = result[i,0]
    //show("cells is: " + string(cells))
    //show("chunk is: " + string(chunk))
    
    new_uuid = entity_create_server(get_x,get_y,entity.asteroid)
    new_entity = entity_from_uuid(new_uuid)
    new_grid = ds_create(ds_type_grid,get_width,get_height)
    ds_set(new_entity,"grid",new_grid)
    
    //loop through the chunk
    //add it to the new asteroid
    //and remove it from the previous
    for (j = 0;j < cells;j++)
        {
        //show("j is : " + string(j))
        get_cell_x = chunk[j,0]
        get_cell_y = chunk[j,1]
        //show("coords: " + string(get_cell_x) + ":" + string(get_cell_y))
        
        get_value = ds_grid_get(get_grid,get_cell_x,get_cell_y)
        ds_grid_set(get_grid,get_cell_x,get_cell_y,false)
        ds_grid_set(new_grid,get_cell_x,get_cell_y,get_value)
        }
    
    //packet_entity_create
    packet_write(packet.entity_create,new_uuid)
    }
show("time to execute parse_asteroid: " + string(get_timer() - time))
