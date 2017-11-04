/// scr_check_collision_line(x1, y1, x2, y2, step)

var _x1 = argument0 * GRID_SIZE + GRID_SIZE / 2;
var _y1 = argument1 * GRID_SIZE + GRID_SIZE / 2;

var _x2 = argument2 * GRID_SIZE + GRID_SIZE / 2;
var _y2 = argument3 * GRID_SIZE + GRID_SIZE / 2;

var _step = argument4;

//get the distance and angle to the target position
var _distance  =  point_distance(_x1, _y1, _x2, _y2)
var _direction = point_direction(_x1, _y1, _x2, _y2);

//iterate 
for (i = 0; i < _distance; i = i + _step) {
	
	var _x3 = _x1 + lengthdir_x(i, _direction);
	var _y3 = _y1 + lengthdir_y(i, _direction);
	
	if (tilemap_get_at_pixel(obj_game.collider, _x3, _y3) & tile_index_mask) {
		return false;
	}
	
}

//
return true;