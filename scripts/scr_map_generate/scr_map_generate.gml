
/// scr_map_generate(width, height)
/// Checks to see if the entity is able to "move" to the target position
/// @param world

//-----------------------------------------------------------------------------

//store the width and height (subtract 1 to account for the 0-indexing)
var _width = (argument0 - 1);
var _height = (argument1 - 1);

//-----------------------------------------------------------------------------

//
var _world = ds_grid_create(_width, _height);

//-----------------------------------------------------------------------------

//initilise the grid as void cells
ds_grid_set_region(_world, 0, 0, _width - 1, _height - 1, TILE_VOID);

//create our rooms
scr_map_create_rooms(_world, 1500, 5, 7);

//create corridors in the gaps left by the rooms
for (var xx = 1; xx < _width; xx += 2) {
    for (var yy = 1; yy < _height; yy += 2) {
		if (ds_grid_get(_world, xx, yy) == TILE_VOID) {		
			scr_map_create_corridors(_world, xx, yy, 0.5);
		}
    }
}

//create doors between our rooms and the corridors
scr_map_create_doors(_world);

//fill in any deadends in our corridors
scr_map_remove_deadends(_world);

//-----------------------------------------------------------------------------

//return the basic world data - this will form the basis of the world layout
return _world;