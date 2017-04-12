///Event_Step()

ds_add(environment_map,"steps since start",1)
var step_time_start = get_timer()

Event_Entity_Create()

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

Event_Entity_Destroy()

ds_set(environment_map,"step time",get_timer() - step_time_start)
