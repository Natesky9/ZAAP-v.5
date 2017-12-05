///generate_random_asteroid(width,height)
//generates an asteroid
var get_entity = argument0
var get_width = argument1
var get_height = argument2

var get_grid = ds_create(ds_type_grid,get_width,get_height)
ds_set(get_entity,"grid",get_grid)

repeat 3
    {
    var x_center = floor(get_width/2)
    var y_center = floor(get_height/2)
    
    var xm = irandom_range(1,get_width-1)
    var ym = irandom_range(1,get_height-1)
    
    var x_dist = min(xm,get_width-xm)
    var y_dist = min(ym,get_height-ym)
    
    var r = random_range(1,min(x_dist,y_dist))
    
    ds_grid_set_disk(get_grid,xm,ym,r,1)
    }


