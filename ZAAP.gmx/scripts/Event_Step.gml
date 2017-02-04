steps_since_game_started += 1
step_time = get_timer()


//input
Event_Keyboard()
Event_Mouse()
//end input

//action
Event_Motion()
Event_Update()
//end action

//detection
Event_Collision()
//end detection

Event_Ping()

step_time = get_timer() - step_time

//show("step time: " + string(step_time))
