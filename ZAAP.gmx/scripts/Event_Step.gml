///Event_Step()

ds_add(envar,"session time",1)
var step_time_start = get_timer()

Event_Entity_Create()

//input
Event_Keyboard()
Event_Mouse()
//Event_Autopilot()
//end input

//action
Event_Motion()
Event_Collision()
//Event_Update()
Event_Fire()
//end action



Event_Ping()

Event_Entity_Destroy()

set("step time",get_timer() - step_time_start)
