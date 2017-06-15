///Event_Mouse()



var done

if mouse_check_button_pressed(mb_left)

    {

    if am_server()

        {

        //do done checks

        done = mouse_left_click_entity_list()

        if done exit

        //

        done = mouse_left_click_ship_grid()

        if done exit

        //

        done = mouse_create()

        if done exit

        //

        effect_create_above(ef_firework,mouse_x,mouse_y,0,c_red)

        exit

        }

    if am_client()

        {

        done = mouse_left_click_entity_list()

        if done exit

        //

        done = mouse_left_click_ship_grid()

        if done exit

        

        done = mouse_left_click_navigation()

        if done exit

        //

        }

    }

//

if mouse_check_button_pressed(mb_right)

    {

    if am_server()

        {

        //

        done = mouse_right_click_entity_list()

        if done exit

        //

        done = mouse_right_click_delete_entity()

        if done exit

        //

        effect_create_above(ef_explosion,mouse_x,mouse_y,0,c_white)

        exit

        //

        }

    }

