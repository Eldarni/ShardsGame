
//-----------------------------------------------------------------------------

//put the "mouse" object where the mouse cursor is
x = mouse_x;
y = mouse_y;

//calculate the current "game" position
current_x = floor(x / GRID_SIZE);
current_y = floor(y / GRID_SIZE);

//-----------------------------------------------------------------------------

//if there is a button under the cursor when the mouse is clicked - then run the buttons script
if (mouse_check_button_pressed(mb_left)) {
	if (instance_position(x, y, obj_button)) {
		with(instance_position(x, y, obj_button)) {
			script_execute(button_action);
		};
	}
}

//-----------------------------------------------------------------------------

//if there is an entity under the mouse then grab that - do we still use this?
if (instance_position(x, y, obj_entity)) {
	entity = instance_position(x, y, obj_entity);
}
else
{
	entity = noone;
}

//-----------------------------------------------------------------------------