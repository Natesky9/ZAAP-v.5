///initialize()
//create the "null" value data structures
//this is necessary because 0 will be the universal "false"
//and having any data structures be returned as 0
//will basically have them ignored
var i = ds_map_create();
var j = ds_list_create();
var k = ds_grid_create(1,1);
var l = ds_stack_create();
var m = ds_queue_create();
var n = ds_priority_create();

//♪patty cake, patty cake♪//
var zero = i+j+k+l+m+n

//
if zero
    {
    //if all data structures are not null
    //throw a fit
    show("//---------------------------------")
    show("Error, null values are not null!")
    show("Don't put ds before initialize()!")
    show("//---------------------------------")
    game_end()
    //bye bye
    }
//

//create the list of data structures
//mostly for debug purposes


static_maps = ds_list_create()
static_lists = ds_list_create()
static_grids = ds_list_create()

dynamic_maps = ds_list_create()
dynamic_lists = ds_list_create()
dynamic_grids = ds_list_create()




