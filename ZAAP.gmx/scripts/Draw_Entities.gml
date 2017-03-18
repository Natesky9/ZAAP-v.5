///Draw_Entities()

if not am_server()
and not am_client()
exit

var get_uuid,get_entity,get_type

for (var i = 0;i < ds_list_size(entity_list);i += 1)
    {
    get_uuid = ds_list_find_value(entity_list,i)
    get_entity = entity_from_uuid(get_uuid)
    
    if is_zero(get_entity)
    continue
    //get the type of entity then filter from there
    get_type = ds_get(get_entity,"type")
    
    switch get_type
        {
        //
        case entity.ship:
            {
            Draw_Entity_Ship(get_entity)
            break
            }
        //
        case entity.bullet:
            {
            Draw_Entity_Bullet(get_entity)
            break
            }
        //
        case entity.shipyard:
            {
            Draw_Entity_Shipyard(get_entity)
            break
            }
        //
        case entity.asteroid:
            {
            Draw_Entity_Asteroid(get_entity)
            break
            }
        //
        case entity.item:
            {
            Draw_Entity_Item(get_entity)
            break
            }
        //
        }
    //draw the entity
    
    //debug get
    var get_speed = ds_get(get_entity,"speed")
    var get_direction = ds_get(get_entity,"direction")
    var get_x = ds_get(get_entity,"x")
    var get_y = ds_get(get_entity,"y")
    //end debug get
    
    if debug_draw
        {
        //draw debug
        font_align(5)
        draw_set_color(c_black)
        draw_text(get_x,get_y-64,get_uuid)

        var vector_x = lengthdir_x(get_speed*4,get_direction)
        var vector_y = lengthdir_y(get_speed*4,get_direction)
        draw_set_color(c_red)
        draw_line(get_x,get_y,get_x+vector_x,get_y+vector_y)
        //end draw debug
        }
    }
