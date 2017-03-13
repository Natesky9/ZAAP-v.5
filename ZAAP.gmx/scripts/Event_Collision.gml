///Event_Collision
if not am_client()
and not am_server()
exit

for (var i = 0;i < ds_list_size(entity_list);i += 1)
    {
    var get_uuid = ds_list_find_value(entity_list,i)
    var get_entity = entity_from_uuid(get_uuid)
    var get_type = get_entity[? "type"]
    
    switch get_type
        {
        //
        case entity.ship:
            {
            Event_Collect_Item()
            break
            }
        case entity.bullet:
            {
            if not am_server()
            break
            
            //only the server runs this
            //timeout
            var get_lifetime = ds_get(get_entity,"lifetime")
            if get_lifetime == 1
                {
                packet_write(packet.entity_destroy,get_uuid)
                entity_destroy_basic(get_uuid)
                break
                }
            get_entity[? "lifetime"] = get_lifetime - 1
            //end timeout
            
            //collision
            var get_x = ds_get(get_entity,"x")
            var get_y = ds_get(get_entity,"y")
            var get_source = ds_get(get_entity,"source")
            
            var collision_entity = entity_find_from_point(get_x,get_y,get_entity)
            if is_zero(collision_entity)
            continue
            
            var collision_uuid = uuid_from_entity(collision_entity)
            if collision_uuid == get_source
            
            continue //nothing to do here
            
            //now check against the type
            var get_collided_type = ds_get(collision_entity,"type")
            
            //
            var get_grid_x,get_grid_y
            var hit = true
            
            if get_collided_type == entity.ship
                {
                hit = false
                
                var get_grid = ds_get(collision_entity,"grid")
                get_grid_x = x_to_grid_x(get_x,get_y,collision_entity)
                get_grid_y = y_to_grid_y(get_x,get_y,collision_entity)
                
                if get_grid_x == -1
                or get_grid_y == -1
                continue //outside grid, no hit
                
                var get_grid_value = grid_get_value(get_grid,get_grid_x,get_grid_y)
                if not is_zero(get_grid_value)
                    {
                    hit = true
                    console_add("entity hit")
                    console_add("x: " + string(get_grid_x) + ",y: " + string(get_grid_y))
                    
                    var grid_max = ds_grid_get_max(get_grid,0,0,
                    ds_grid_width(get_grid),ds_grid_height(get_grid))
            
                    if grid_max > 0
                        {
                        packet_write(packet.grid_set,collision_uuid,get_grid_x,get_grid_y,0)
                        grid_set_value(get_grid,get_grid_x,get_grid_y,0)
                        }
                    if grid_max == 0
                        {
                        //if nothing there, destroy it
                        packet_write(packet.entity_destroy,get_uuid)
                        entity_destroy_basic(get_uuid)
                        console_add("Entity destroyed because no grid")
                        continue
                        }
                    }
                }
                
            if not hit
                {
                continue
                }
            

            var get_collided_health = uuid_damage(collision_uuid,1)
            var get_health = uuid_damage(get_uuid,1)
            packet_write(packet.entity_damage,get_uuid,1)
            packet_write(packet.entity_damage,collision_uuid,1)
            if not get_collided_health
                {
                packet_write(packet.entity_destroy,collision_uuid)
                entity_destroy_basic(collision_uuid)
                }
            if not get_health
                {
                packet_write(packet.entity_destroy,get_uuid)
                entity_destroy_basic(get_uuid)
                }
            //end collision
            }
        //
        }
    }
