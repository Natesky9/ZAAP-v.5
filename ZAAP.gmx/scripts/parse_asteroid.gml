///parse_asteroid(uuid,entity,grid,[break_x,break_y])
//when inputing a grid, outputs the seperated
//grids as arrays
//SERVER
//----------------------------------------//
var time = get_timer()
var get_entity,get_uuid,check_continuity,get_break_x,get_break_y,get_grid,
    get_width,get_height,grid_max,size,test_size,coords,get_x,get_y,
    first_neighbor,test_neighbor,first_side,second_side,size_of_checked,
    size_of_population,h,w,i,t,j,get_cell,int_cell,result,temp,temp_num,
    first,seed_x,seed_y,test_x,test_y,is_free,to_remove,chunks,get_value,
    cells,chunk,new_uuid,new_entity,new_grid,
var get_test_x,get_test_y,get_cell_x,get_cell_y,
//----------------------------------//
var population = ds_list_create();
var to_check = ds_list_create()
var has_checked = ds_list_create()
//----------------------------------//
var get_uuid = argument[0]
get_entity = argument[1]
var get_grid = argument[2]
//--------------------//
check_continuity = argument_count == 5

if check_continuity
    {
    show("continuity is on")
    get_break_x = argument[3]
    get_break_y = argument[4]
    //for continuity shortcut
    }

get_grid = ds_get(get_entity,"grid")


get_width = ds_grid_width(get_grid)
get_height = ds_grid_height(get_grid);

grid_max = max(get_width,get_height)
//-------------------------//
//early exit check
//-------------------------//
if check_continuity
    {
    var continuity_timer = -get_timer()
    for (i = 1;i <= 6;i++)
        {
        //get the cell to test
        coords = hex_direction_to_grid(i,get_break_x,get_break_y)
        get_cell_x = get_break_x + coords[0];
        get_cell_y = get_break_y + coords[1];
        
        //check if in bounds
        if not grid_in_bounds(get_width,get_height,get_cell_x,get_cell_y)
            {
            //this cell would be out of bounds
            continue
            }
        
        if ds_grid_get(get_grid,get_cell_x,get_cell_y)
            {
            ds_list_add(population,i)
            }
        }
    size_of_population = ds_list_size(population)
    //show("size of population: " + string(size_of_population))
    //early exit if we have 1,5, or 6 neighbors
    switch size_of_population
        {
        case 0:
            {
            show("entity is empty, destroying")
            get_uuid = uuid_from_entity(get_entity)
            entity_destroy_basic(get_uuid)
            }
        case 1:
        case 5:
        case 6:
            {
            ds_list_destroy(population)
            ds_list_destroy(to_check)
            ds_list_destroy(has_checked)
            show("time to execute parse_asteroid: " + string(get_timer() - time))
            exit
            }
        }
    
    //now we have the list of immediately adjacent cells,
    //we test for continuity
    first_neighbor = ds_list_find_value(population,0)
    ds_list_add(to_check,first_neighbor)
    ds_list_add(has_checked,first_neighbor)
    
    while ds_list_size(to_check)
        {
        //do this until we run out of to_check
        test_neighbor = ds_list_find_value(to_check,0)
        ds_list_delete(to_check,0)
        
        //first side
        first_side = ((test_neighbor - 1 - 1 + 6) mod 6) + 1
        coords = hex_direction_to_grid(first_side,get_break_x,get_break_y)
        get_cell_x = get_break_x + coords[0];
        get_cell_y = get_break_y + coords[1];
        if ds_grid_get(get_grid,get_cell_x,get_cell_y)
            {
            if ds_list_find_index(has_checked,first_side) < 0
                {
                ds_list_add(to_check,first_side)
                ds_list_add(has_checked,first_side)
                }
            }
        //second side
        second_side = ((test_neighbor - 1 + 1) mod 6 ) + 1
        coords = hex_direction_to_grid(second_side,get_break_x,get_break_y)
        get_cell_x = get_break_x + coords[0];
        get_cell_y = get_break_y + coords[1];
        if ds_grid_get(get_grid,get_cell_x,get_cell_y)
            {
            if ds_list_find_index(has_checked,second_side) < 0
                {
                ds_list_add(to_check,second_side)
                ds_list_add(has_checked,second_side)
                }
            }
        }
    //done doing the loop
    
    if size_of_population == ds_list_size(has_checked)
        {
        //show("Grid is continuous, no need to continue parsing!")
        ds_list_destroy(population)
        ds_list_destroy(to_check)
        ds_list_destroy(has_checked)
        
        show("time to execute parse_asteroid: " + string(get_timer() - time))
        exit
        }
    continuity_timer += get_timer()
    show("continuity time took: " + string(continuity_timer))
    }
//
//show("-----------")
//show("GRID BROKE")
//show("-----------")
//----------------------------------------//
get_x = ds_get(get_entity,"x")
get_y = ds_get(get_entity,"y")
var get_heading = ds_get(get_entity,"heading")
var get_direction = ds_get(get_entity,"direction")
var get_speed = ds_get(get_entity,"speed")

//populate population with all cells
var population_timer = -get_timer()

ds_list_clear(population)
ds_list_clear(to_check)
ds_list_clear(has_checked)

for (h = 0;h < get_height;h += 1)
    {
    for (w = 0;w < get_width;w += 1)
        {
        get_cell = ds_grid_get(get_grid,w,h)        
        if get_cell
            {
            int_cell = coord_to_int(w,h,grid_max)
            ds_list_add(population,int_cell)
            }
        }
    }
//---------------------------------//
//done populating
//---------------------------------//
chunk = 0
while ds_list_size(population)
    {
    //move seed 0 to check
    var seed = ds_list_find_value(population,0)
    ds_list_delete(population,0)
    
    ds_list_add(to_check,seed)
    ds_list_add(has_checked,seed)
    
    if chunk > 0
        {
        //create a new grid to be used later
        new_grid = ds_create(data.dynamic,ds_type_grid,get_width,get_height)
        seed_x = int_to_coord_x(seed,grid_max)
        seed_y = int_to_coord_y(seed,grid_max)
        
        var seed_value = ds_grid_get(get_grid,seed_x,seed_y)
        
        ds_grid_set(get_grid,seed_x,seed_y,0)
        ds_grid_set(new_grid,seed_x,seed_y,seed_value)
        }
    
    while ds_list_size(to_check)
        {
        cell_to_check = ds_list_find_value(to_check,0)
        ds_list_delete(to_check,0)
        
        cell_to_check_x = int_to_coord_x(cell_to_check,grid_max)
        cell_to_check_y = int_to_coord_y(cell_to_check,grid_max)
        
        for (i = 1;i <= 6;i++)
            {
            //get the cell to test
            coords = hex_direction_to_grid(i,cell_to_check_x,cell_to_check_y)
            get_test_x = cell_to_check_x + coords[0];
            get_test_y = cell_to_check_y + coords[1];
            
            int_cell = coord_to_int(get_test_x,get_test_y,grid_max)
            
            //check if in bounds
            if not grid_in_bounds(get_width,get_height,get_test_x,get_test_y)
                {
                continue
                }
            //check if cell is empty
            if not ds_grid_get(get_grid,get_test_x,get_test_y)
                {
                continue
                }
            
            //if it hasn't been checked
            if ds_list_find_index(has_checked,int_cell) < 0
                {
                ds_list_add(has_checked,int_cell)
                ds_list_add(to_check,int_cell)
                pos = ds_list_find_index(population,int_cell)
                ds_list_delete(population,pos)
                
                //if this isn't part of the main chunk, make a new one
                if chunk
                    {
                    //get what it used to be
                    get_value = ds_grid_get(get_grid,get_test_x,get_test_y)
                    //add to a grid to be used later
                    ds_grid_set(new_grid,get_test_x,get_test_y,get_value)
                    //clear it from the old one
                    ds_grid_set(get_grid,get_test_x,get_test_y,0)
                    }
                }
            }
        }
    ds_list_clear(to_check)
    ds_list_clear(has_checked)
    //done with this chunk
    if chunk
        {
        new_uuid = entity_create_server(get_x,get_y,entity.asteroid)
        new_entity = entity_from_uuid(new_uuid)
        
        //set the grid from what we made earlier
        ds_set(new_entity,"grid",new_grid,key.grid)
        ds_set(new_entity,"heading",get_heading,key.value)
        ds_set(new_entity,"direction",get_direction,key.value)
        ds_set(new_entity,"speed",get_speed,key.value)
        
        //packet_entity_create
        packet_write(packet.entity_create,new_uuid)
        }
    
    //move on to the next chunk
    chunk++
    }

//packet_entity_set_grid
packet_write(packet.entity_set_grid,get_uuid,get_grid)
entity_create_hex_vertex_buffer(get_entity)

ds_list_destroy(population)
ds_list_destroy(to_check)
ds_list_destroy(has_checked)
show("time to execute parse_asteroid: " + string(get_timer() - time))
