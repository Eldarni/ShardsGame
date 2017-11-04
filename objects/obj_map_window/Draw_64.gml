/// @description Insert description here
// You can write your code in this editor
draw_self();

//
var _level_width = obj_game.level.level_width - 1;
var _level_height = obj_game.level.level_height - 1;

//
var _map_x = x + 32;
var _map_y = y + 32;

var _map_w = 600;
var _map_h = 600;

var _cw = floor(_map_w / _level_width);
var _ch = floor(_map_h / _level_height);


draw_set_color(make_color_rgb(92, 57, 0));

//iterate over the world data, compare it with the explored data, and show a tile for each explored "floor"
for (var xx = 0; xx < _level_width; xx++) {
	for (var yy = 0; yy < _level_height; yy++) {

		if (obj_game.level.ds_world[# xx, yy] == TILE_VOID and obj_game.level.ds_explored[# xx, yy] == 1) {
			draw_rectangle(_map_x + (_cw * xx), _map_y + (_ch * yy), _map_x + (_cw * xx) + _cw , _map_y + (_ch * yy) + _ch, false);
		}

	}	
}


draw_set_color(c_white);