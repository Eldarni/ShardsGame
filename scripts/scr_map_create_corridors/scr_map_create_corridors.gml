/// scr_map_create_corridors(world, x, y, change)
/// Carves a "maze" from the starting position, continues until it can tunnel no more

//-----------------------------------------------------------------------------

var _world   = argument0;
var _start_x = argument1;
var _start_y = argument2;

var _direction_change_chance = argument3;

//-----------------------------------------------------------------------------

//get the room boundaries - these are inset from the actual dimensions as we want a 1 tile border
var _world_xmin = 1;
var _world_xmax = ds_grid_width(_world) - 2;

var _world_ymin = 1;
var _world_ymax = ds_grid_height(_world) - 2;

//carve out our starting tile
ds_grid_set(_world, _start_x, _start_y, TILE_HALL);

//pick a random direction to begin with
var _direction = irandom(3); //0 = right, 1 = up, 2 = left, 3 = down (muliply by 90 to get angle)

//create a list to hold out tunneling options
var _options = ds_list_create();

//create a list to store the "queue" of cells to carve out = and add our starting cell
var _stack = ds_list_create()
ds_list_add(_stack, pack_xy(_start_x, _start_y));

//dig until we can dig no more!
while (ds_list_size(_stack) > 0) {

	//--------------------------------------------------------------------------------
	
	//pick a random cell from the stack
	var _cell_index = irandom(ds_list_size(_stack) - 1);
	var _cell = unpack_xy(ds_list_find_value(_stack, _cell_index));
	
	//--------------------------------------------------------------------------------

	//populate a list with the valid direction that we are able to tunnel in
	if (_cell[0] > _world_xmin and ds_grid_get(_world, _cell[0] + lengthdir_x(2, DIR_W), _cell[1] + lengthdir_y(2, DIR_W)) == TILE_VOID) { //west
		ds_list_add(_options, DIR_W);
	}
	
	if (_cell[0] < _world_xmax and ds_grid_get(_world, _cell[0] + lengthdir_x(2, DIR_E), _cell[1] + lengthdir_y(2, DIR_E)) == TILE_VOID) { //east
		ds_list_add(_options, DIR_E);
	}

	if (_cell[1] > _world_ymin and ds_grid_get(_world, _cell[0] + lengthdir_x(2, DIR_N), _cell[1] + lengthdir_y(2, DIR_N)) == TILE_VOID) { //north
		ds_list_add(_options, DIR_N);
	}

	if (_cell[1] < _world_ymax and ds_grid_get(_world, _cell[0] + lengthdir_x(2, DIR_S), _cell[1] + lengthdir_y(2, DIR_S)) == TILE_VOID) { //south
		ds_list_add(_options, DIR_S);
	}

	//--------------------------------------------------------------------------------

    //if there is no where to go - then we have reached the end of the line - mind the gap
    if (ds_list_size(_options) == 0) {
		ds_list_delete(_stack, _cell_index);
        continue;
    }
	
	//have a random change chance, or change direction if we are unable to tunnel in the current direction
    if (random(1) <= _direction_change_chance or ds_list_find_index(_options, _direction) == -1) {
		var _direction = _options[| irandom(ds_list_size(_options) - 1)];
    }

	//--------------------------------------------------------------------------------

	//carve out our tunnel to the target tile (2 tiles in the direction we have chosen (this keep the tunnel on "odd" tiles))
	ds_grid_set(_world, _cell[0] + lengthdir_x(1, _direction), _cell[1] + lengthdir_y(1, _direction), TILE_HALL);
	ds_grid_set(_world, _cell[0] + lengthdir_x(2, _direction), _cell[1] + lengthdir_y(2, _direction), TILE_HALL);

	//add the cell at the end of the tunnel to the stack so it can be continued if it has room to expand
	ds_list_add(_stack, pack_xy((_cell[0] + lengthdir_x(2, _direction)), (_cell[1] + lengthdir_y(2, _direction))));

	//--------------------------------------------------------------------------------
	
	//
	ds_list_clear(_options);
	
	//--------------------------------------------------------------------------------
	
}

//
ds_list_destroy(_options);
ds_list_destroy(_stack);

//-----------------------------------------------------------------------------
