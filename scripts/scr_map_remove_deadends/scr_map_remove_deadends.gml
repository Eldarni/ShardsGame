/// scr_map_remove_deadends(world)
/// Carves a "maze" from the starting position, continues until it can tunnel no more

//=============================================================================

var _world = argument0;

//=============================================================================

//get the room boundaries - as we will be inteating over the world a few times
var _world_xmin = 0;
var _world_xmax = ds_grid_width(_world) - 1;

var _world_ymin = 0;
var _world_ymax = ds_grid_height(_world) - 1;

//=============================================================================

var _cells_removed = true;

while (_cells_removed == true) {

	//start by assuming no cells will be removed
	_cells_removed = false;

	//iterate over each tile in the world, if we find a non void tile - do a flood fill for all tha matching tiles
	for (var xx = _world_xmin; xx < _world_xmax; xx += 1) {
	    for (var yy = _world_ymin; yy < _world_ymax; yy += 1) {
		
			//-------------------------------------------------------------------------
		
			//room are the same tile as door - this means this check will run on each room cell - maybe could optimise???
			if (ds_grid_get(_world, xx, yy) == TILE_REGION or ds_grid_get(_world, xx, yy) == TILE_DOOR) {
	
	
				//			        
				var _void_counter = 0;
					
				//count how many "TILE_VOID" cells are adjacent to the current cell
				if (ds_grid_get(_world, xx + 1, yy) == TILE_VOID) { _void_counter++; }
				if (ds_grid_get(_world, xx - 1, yy) == TILE_VOID) { _void_counter++; }
				if (ds_grid_get(_world, xx, yy + 1) == TILE_VOID) { _void_counter++; }
				if (ds_grid_get(_world, xx, yy - 1) == TILE_VOID) { _void_counter++; }

				//if the cell has 3 or more walls, then we should remove it from the list
				if (_void_counter >= 3) {
				    ds_grid_set(_world, xx, yy, TILE_VOID);
					_cells_removed = true;
				}

			}  
		
	
		
			//-------------------------------------------------------------------------
		
	    }
	}
	
}

//=============================================================================



//loop over the cells one by one, untill an entire iteration goes by without removing a deadend