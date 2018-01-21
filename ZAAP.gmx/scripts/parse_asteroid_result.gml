///parse_asteroid_result(array)
//second part of parse_asteroid
var get_entity = argument0
var result = argument1

var chunks = result[0,0]
show("number of chunks: " + string(chunks))

if chunks == 1
exit

var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")
var get_grid = ds_get(get_entity,"grid")
var get_width = ds_grid_width(get_grid)
var get_height = ds_grid_height(get_grid)

for (var i = 2;i <= chunks;i++)
    {
    var cells = result[0,i]
    show("cells in chunk " + string(i) + ": " + string(cells))
    var chunk = result[i,0]
    show("cells is: " + string(cells))
    show("chunk is: " + string(chunk))
    
    var new_uuid = entity_create_server(get_x,get_y,entity.asteroid)
    var new_entity = entity_from_uuid(new_uuid)
    var new_grid = ds_create(ds_type_grid,get_width,get_height)
    ds_set(new_entity,"grid",new_grid)
    
    //loop through the chunk
    //add it to the new asteroid
    //and remove it from the previous
    for (var j = 0;j < cells;j++)
        {
        show("j is : " + string(j))
        var get_cell_x = chunk[j,0]
        var get_cell_y = chunk[j,1]
        show("coords: " + string(get_cell_x) + ":" + string(get_cell_y))
        
        var get_value = ds_grid_get(get_grid,get_cell_x,get_cell_y)
        ds_grid_set(get_grid,get_cell_x,get_cell_y,false)
        ds_grid_set(new_grid,get_cell_x,get_cell_y,get_value)
        }
    
    //packet_entity_create
    packet_write(packet.entity_create,new_uuid)
    }
