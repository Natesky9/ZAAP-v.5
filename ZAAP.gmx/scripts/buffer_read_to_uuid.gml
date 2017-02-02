///buffer_read_to_uuid(get_uuid)

//create the entity
get_entity = create_entity()

//find out how many keys are to be read
var get_list_size = buffer_read(bin,buffer_u8)

repeat get_list_size
    {
    //get the key from string
    var get_key = buffer_read(bin,buffer_string)
    show("This is right before reading the grid")
    //change to switch later
    /*
    if get_key == "grid"
        {
        show("Attempting to read grid from buffer")
        var get_grid = buffer_read_to_grid();
        get_entity[? "grid"] = get_grid
        show("Successfully read grid from buffer")
        continue
        }
    */
    //get the buffer type
    var get_buffer_type = key_to_buffer_type(get_key)
    //read based off of the type
    var get_value = buffer_read(bin,get_buffer_type);
    //
    show("updated key [" + get_key + "] with value of [" + string(get_value) + "]")
    
    if not ds_map_exists(get_entity,get_value)
        {
        show("This key didn't exist, creating new key")
        entity_add_new_key(get_entity,get_key,get_value)
        }
    else
        {
        get_entity[? get_key] = get_value
        }
    }

//finish up by mapping uuid to entity
var get_uuid = ds_get(get_entity,"uuid")
ds_map_add(entity_map,get_uuid,get_entity)
ds_list_add(entity_list,get_uuid)
show("created entity with uuid of [" + string(get_uuid) + "]")
//we're done here
