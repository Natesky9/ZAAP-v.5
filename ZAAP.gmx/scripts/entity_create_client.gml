///entity_create_client()
//network version of the create event
get_entity = entity_create_basic()

//find out how many keys are to be read
var get_list_size = read()

repeat get_list_size
    {
    read_buffer_to_key(get_entity)
    }

//finish up by mapping uuid to entity
entity_map_uuid(get_entity)
var get_uuid = ds_get(get_entity,"uuid")

if is_zero(get_uuid)
    {
    show("Error, received entity had no uuid")
    exit
    }



//effect bits
var get_type = ds_get(get_entity,"type")
var get_x = ds_get(get_entity,"x")
var get_y = ds_get(get_entity,"y")

if get_type == entity.bullet
    {
    audio_play_sound(zaap,1,false)
    effect_create_above(ef_ring,get_x,get_y,0,c_blue)
    }
if get_type == entity.ship
    {
    effect_create_above(ef_firework,get_x,get_y,2,c_green)
    }

//we're done here
