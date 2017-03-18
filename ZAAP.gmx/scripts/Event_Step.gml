///Event_Step()

ds_add(environment,"steps since start",1)
var step_time_start = get_timer()


//input
Event_Keyboard()
Event_Mouse()
Event_Autopilot()
//end input

//action
Event_Motion()
Event_Update()
//end action

//detection
Event_Collision()
//end detection

Event_Ping()

ds_set(environment,"step time",get_timer() - step_time_start)
