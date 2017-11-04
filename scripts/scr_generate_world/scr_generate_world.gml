/// scr_generate_world(world)

//-----------------------------------------------------------------------------

var _world = argument0;

//-----------------------------------------------------------------------------

				//resise the room to fit our requested level size
				//room_width  = (_world.level_width  - 1) * GRID_SIZE; 
				//room_height = (_world.level_height - 1) * GRID_SIZE;

				show_debug_message("Room Size is " + string(_world.level_width) + "x" + string(_world.level_height));

//-----------------------------------------------------------------------------

//generate a new map based on the world settings...
if (script_exists(_world.level_generation)) {
	_world.ds_world = script_execute(_world.level_generation, _world.level_width, _world.level_height)
}

//-----------------------------------------------------------------------------

			//init our pathfinding grid
			_world.mp_navigation = mp_grid_create(0, 0, _world.level_width, _world.level_height, GRID_SIZE, GRID_SIZE);

			//convert the world map into the screen visible tiles - should these changes be made to the ds_world - then rendered?
			for (var xx = 0; xx < (_world.level_width - 1); xx++) {
				for (var yy = 0; yy < (_world.level_height -1 ); yy++) {
					if (_world.ds_world[# xx, yy] == TILE_VOID) {
						mp_grid_add_cell(_world.mp_navigation, xx, yy);
			
					}
				}			
			}

//-----------------------------------------------------------------------------