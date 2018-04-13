///generate_random_asteroid(uuid,entity,width,height)
//generates an asteroid
var get_uuid = argument0
var get_entity = argument1
var get_width = argument2
var get_height = argument3

var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")

var random_x,random_y

var get_grid = ds_create(data.dynamic,ds_type_grid,get_width,get_height)
ds_set(get_entity,"grid",get_grid)

var x_center = floor(get_width/2)
var y_center = floor(get_height/2)
var min_dist = min(x_center,y_center)
//ds_grid_set_disk(get_grid,x_center,y_center,min_dist/2,1)

var rock_material = irandom_range(item.rockred,item.rockblue)
repeat irandom_range(4,8)
    {
    var random_dir = irandom(360)
    random_x = lengthdir_x(min_dist/2,random_dir)
    random_y = lengthdir_y(min_dist/2,random_dir)
    
    var get_rock_x = random_x + x_center
    var get_rock_y = random_y + y_center
    
    
    ds_grid_set_disk(get_grid,get_rock_x,get_rock_y,min_dist/2,1)
    }

var ore_material = irandom_range(item.orered,item.gemblue)
repeat 4
    {
    var valid_position = false
    do
        {
        random_x = irandom_range(4,get_width-4)
        random_y = irandom_range(4,get_height-4)
        
        valid_position =
        grid_in_bounds(get_width,get_height,random_x,random_y)
        and ds_grid_get(get_grid,random_x,random_y)
        }
    until valid_position
    
    ds_grid_set_disk(get_grid,random_x,random_y,1,ore_material)
    }


show("parsing asteroid...")
parse_asteroid(get_uuid,get_entity,get_grid)

//parse_asteroid_result(get_entity,result)
