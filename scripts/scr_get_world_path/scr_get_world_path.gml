/// scr_get_world_path(path, x1, y1, x2, x3)
/// @param entity   Required - The instance of the entity that is being controlled by this logic

//-----------------------------------------------------------------------------

var _path = argument0;
var _x1   = argument1;
var _y1   = argument2;
var _x2   = argument3;
var _y2   = argument4;

//-----------------------------------------------------------------------------

//convert the world position into game coordinates (use the tile center)
_x1 = (_x1 * GRID_SIZE + (GRID_SIZE / 2));
_y1 = (_y1 * GRID_SIZE + (GRID_SIZE / 2));
_x2 = (_x2 * GRID_SIZE + (GRID_SIZE / 2));
_y2 = (_y2 * GRID_SIZE + (GRID_SIZE / 2));

//can we path to the target?
if (mp_grid_path(obj_game.level.mp_navigation, _path, _x1, _y1, _x2, _y2, true)) {
	return true;	
}

//nope
return false;