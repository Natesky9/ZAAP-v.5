///generate_random_asteroid(entity,width,height)
//generates an asteroid
var get_entity = argument0
var get_width = argument1
var get_height = argument2

var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")

var random_x,random_y

var get_grid = ds_create(ds_type_grid,get_width,get_height)
ds_set(get_entity,"grid",get_grid)

var x_center = floor(get_width/2)
var y_center = floor(get_height/2)
var min_dist = min(x_center,y_center)
//ds_grid_set_disk(get_grid,x_center,y_center,min_dist/2,1)

repeat irandom_range(4,8)
    {
    var random_dir = irandom(360)
    random_x = lengthdir_x(min_dist/2,random_dir)
    random_y = lengthdir_y(min_dist/2,random_dir)
    
    var get_rock_x = random_x + x_center
    var get_rock_y = random_y + y_center
    
    ds_grid_set_disk(get_grid,get_rock_x,get_rock_y,min_dist/2,1)
    }

var ore = choose(2,3,4)
repeat 4
    {
    do
        {
        random_x = irandom_range(4,get_width-4)
        random_y = irandom_range(4,get_height-4)
        }
    until ds_grid_get(get_grid,random_x,random_y)
    
    ds_grid_set_disk(get_grid,random_x,random_y,1,ore)
    }
    
show("parsing asteroid...")
parse_asteroid(get_entity)

//parse_asteroid_result(get_entity,result)
