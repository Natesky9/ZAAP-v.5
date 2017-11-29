///Event_Fire
//event for ships to fire weapons

if not am_server()
exit

var entity_ship_list = entity_list(entity.ship)

var entity_ship_list_size = ds_list_size(entity_ship_list)

for (var i = 0;i < entity_ship_list_size;i += 1)
    {
    var get_ship_uuid = ds_list_find_value(entity_ship_list,i)
    var get_ship_entity = entity_from_uuid(get_ship_uuid)
    
    var get_trigger = ds_get(get_ship_entity,"trigger")
    var get_trigger_timer = ds_get(get_ship_entity,"trigger timer")
    
    if get_trigger_timer
        {
        ds_add(get_ship_entity,"trigger timer",-1)
        continue
        }
        
    //if it's not firing, skip
    if is_zero(get_trigger)
    continue
    
    var get_x = ds_get(get_ship_entity,"x")
    var get_y = ds_get(get_ship_entity,"y")
    var get_direction = ds_get(get_ship_entity,"direction")
    var get_speed = ds_get(get_ship_entity,"speed")
    var get_heading = ds_get(get_ship_entity,"heading")
    
    
    //create the bullet
    var get_uuid = entity_create_server(get_x,get_y,entity.bullet)
    var get_entity = entity_from_uuid(get_uuid);
    ds_set(get_entity,"speed",get_speed + 10)
    ds_set(get_entity,"direction",get_heading)
    ds_set(get_entity,"heading",get_heading)
    ds_set(get_entity,"source",get_ship_uuid)
    ds_set(get_entity,"lifetime",60)
    
    //packet_entity_create
    packet_write(packet.entity_create,get_uuid)
    
    //reset the trigger timer
    
    entity_issue_command(get_ship_entity,"trigger timer",10)
    
    console_add("pew")
    }
