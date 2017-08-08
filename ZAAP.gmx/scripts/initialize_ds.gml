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
data_structure_grid_list = ds_list_create()
data_structure_list_list = ds_list_create()
data_structure_map_list = ds_list_create()
data_structure_priority_list = ds_list_create()
data_structure_queue_list = ds_list_create()
data_structure_stack_list = ds_list_create()
data_structure_grid_amount = 0
data_structure_list_amount = 0
data_structure_map_amount = 0
data_structure_priority_amount = 0
data_structure_queue_amount = 0
data_structure_stack_amount = 0
