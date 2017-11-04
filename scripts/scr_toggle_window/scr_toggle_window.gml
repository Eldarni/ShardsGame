///scr_toggle_window(window)

//-----------------------------------------------------------------------------

var _window_name = string(argument0);
var _window      = argument0;

//-----------------------------------------------------------------------------

if (ds_map_find_value(obj_game.windows, _window_name)) {
	with (ds_map_find_value(obj_game.windows, _window_name)) {
		instance_destroy();
	}
	ds_map_delete(obj_game.windows, _window_name);
}
else 
{	
	//create a new instance of the requested window object
	var _window = instance_create_layer(0, 0, "Interface", _window);
	
	//center the window in the screen (remember the window is rendered at the screen pos)
	_window.x = (camera_get_view_width(view_camera[0]) - _window.sprite_width) / 2;
	_window.y = (camera_get_view_height(view_camera[0]) - _window.sprite_height) / 2;
	
	//
	ds_map_add(obj_game.windows, _window_name, _window);
}

//-----------------------------------------------------------------------------
