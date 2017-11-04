
//-----------------------------------------------------------------------------

//NOTE: removed the "mouse" focus as it was painful to use controls etc

//get the distance and direction we will be moving towards
//var _distance =  point_distance(x, y, mouse_x, mouse_y);
//var _direction = point_direction(x, y, mouse_x, mouse_y);

//get the target position within a defined radius of our player
if (obj_game.player != noone) {
	target_x = obj_game.player.x;// + lengthdir_x(min(96, _distance), _direction);
	target_y = obj_game.player.y;// + lengthdir_y(min(96, _distance), _direction);
}

//apply the movement to the target position (with some easing)
x += ceil((target_x - x) / 25);
y += ceil((target_y - y) / 25);

//move the main view to center the camara object
var _camera_x = -(camera_get_view_width(view_camera[0]) / 2) + x;
var _camera_y = -(camera_get_view_height(view_camera[0]) / 2) + y;

camera_set_view_pos(view_camera[0], _camera_x, _camera_y);

//-----------------------------------------------------------------------------