/// scr_map_create_doors(world)
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

//to create our doors, we must know what needs to connect to what - to do this create "regions" out of each contigous block of tiles
var _regions = ds_list_create();

//interate over each tile in the world, if we find a non void tile - do a flood fill for all tha matching tiles
for (var xx = _world_xmin; xx < _world_xmax; xx += 1) {
    for (var yy = _world_ymin; yy < _world_ymax; yy += 1) {
		
		//-------------------------------------------------------------------------
		
		//if the cell is a not a void or already in a "region" - then start a flood fill to finde the extent of the region
		if (ds_grid_get(_world, xx, yy) != TILE_VOID and ds_grid_get(_world, xx, yy) != TILE_REGION) {

			//create a new region to hold the cells in question
			var _region = ds_list_create();

			//and add it to the regions list for later (ab)use
			ds_list_add(_regions, _region);
						
			//create a list to hold the cells as we test them
			var _stack = ds_list_create();

			//push the starting cell into out list
			ds_list_add_unique(_stack, pack_xy(xx, yy));

			//iterate over the list as we build it
			for (var i = 0; i < ds_list_size(_stack); i++) {
				
				var _cell = unpack_xy(_stack[| i]);
						
				if (ds_grid_get(_world, _cell[0], _cell[1]) == TILE_ROOM or ds_grid_get(_world, _cell[0], _cell[1]) == TILE_HALL) {
        
					//mark the cell as being contained in the region
					ds_grid_set(_world, _cell[0], _cell[1], TILE_REGION);
							
					//add the cell to the current regions grid
					ds_list_add_unique(_region, pack_xy(_cell[0], _cell[1]));
					
					//add the 4 surrounding cells to the list to check next - we could use pack_xy and unpack_xy here if we wanted to
					ds_list_add_unique(_stack, pack_xy(_cell[0] + 1, _cell[1]));
					ds_list_add_unique(_stack, pack_xy(_cell[0] - 1, _cell[1]));
					ds_list_add_unique(_stack, pack_xy(_cell[0], _cell[1] + 1));
					ds_list_add_unique(_stack, pack_xy(_cell[0], _cell[1] - 1));

				}		

			}
			
			//remove the list now we are done with it (will create a new one if needed)
			ds_list_destroy(_stack);
						
		}
		
		//-------------------------------------------------------------------------
		
    }
}


//=============================================================================

//how many regions do we have in total
var _regions_count = ds_list_size(_regions);

//create a list to hold every connector
var _all_region_connectors = ds_list_create();

//create a list of lists - to hold the connector cells that we are about to identify
var _region_connectors = ds_list_create();
for (var i = 0; i < _regions_count; i++) {
	ds_list_add(_region_connectors, ds_list_create());
	ds_list_mark_as_list(_region_connectors, i);
}

//=============================================================================

//for each void cell - count how many regions it borders, if it's 2 or more then it's a connector
for (var xx = _world_xmin; xx < _world_xmax; xx += 1) {
    for (var yy = _world_ymin; yy < _world_ymax; yy += 1) {

		//-------------------------------------------------------------------------

		//if it is a void cell - find how many regions this cell is connected to
		if (ds_grid_get(_world, xx, yy) == TILE_VOID) {
			
			//create a list to hold the regions that this cell is bordering (if any)
			var _regions_bordered = ds_list_create();
			
			//check for a region in each cardinal direction			
			for (var i = 0; i < _regions_count; i++) {
				if (ds_list_find_index(_regions[|i], pack_xy(xx + 1, yy)) != -1) { ds_list_add_unique(_regions_bordered, i); }
				if (ds_list_find_index(_regions[|i], pack_xy(xx - 1, yy)) != -1) { ds_list_add_unique(_regions_bordered, i); }
				if (ds_list_find_index(_regions[|i], pack_xy(xx, yy + 1)) != -1) { ds_list_add_unique(_regions_bordered, i); }
				if (ds_list_find_index(_regions[|i], pack_xy(xx, yy - 1)) != -1) { ds_list_add_unique(_regions_bordered, i); }
			}
			
			//if it has 2 or more borders, then it is a connector cell - add it to the regions connector list
			if (ds_list_size(_regions_bordered) >= 2) {
				ds_list_add_unique(_all_region_connectors, pack_xy(xx, yy));
				for (var i = 0; i < ds_list_size(_regions_bordered); i++) {
					ds_list_add_unique(_region_connectors[|ds_list_find_value(_regions_bordered, i)], pack_xy(xx, yy));
				}
			}
			
			//
			ds_list_destroy(_regions_bordered);
		
		}
		
		//-------------------------------------------------------------------------
    }
}

//=============================================================================

//start to pick which connectors to use - to ensure a 100% reachable map

//pick a region to be our "master" region - this choice really doesn't matter
var _master_region = ds_list_find_value(_region_connectors, 0);
ds_list_delete(_region_connectors, 0); //remove the master region from the list

//while we have regions left, pick a random connector in the master region and asimilate the region it is connected to
while (ds_list_size(_region_connectors) > 0) {

	//-------------------------------------------------------------------------

	//pick a connecter at random - this will be our door
	var _chosen_connector = ds_list_find_value(_master_region, irandom((ds_list_size(_master_region) - 1)));

	////show the cell we are testing on the map
	//var _cell = unpack_xy(_chosen_connector);
	//ds_grid_set(_world, _cell[0], _cell[1], TILE_ROOM);

	//find the other region that is connected to the same cell - we will assimilate this into our master region
	for (var i = 0; i < ds_list_size(_region_connectors); i++) {
	
		var _doner_region = ds_list_find_value(_region_connectors, i);
		
		if (ds_list_find_index(_region_connectors[|i], _chosen_connector) != -1) { 
		
			//update the map to inclkude a door at the connecting cells location
			var _cell = unpack_xy(_chosen_connector);
			ds_grid_set(_world, _cell[0], _cell[1], TILE_DOOR);
					
			//show_debug_message("=== MASTER REGION ===")
			//show_debug_list(_master_region);
			
			//show_debug_message("=== DONER REGION ===")
			//show_debug_list(_doner_region);
			
			//merge the doner regions connectors into the master region - remove any values that are shared between them - @todo - review this it "may" be dropping odd connectors
			for (var j = 0; j < ds_list_size(_doner_region); j++) {
				
				//get the value for the cell in doner
				var _connector = ds_list_find_value(_doner_region, j);
				var _connector_index = ds_list_find_index(_master_region, _connector);
			
				if (_connector_index == -1) {
					ds_list_add(_master_region, _connector);
				}
				else
				{
					ds_list_delete(_master_region, _connector_index);
				}
			
			}
			
			//show_debug_message("=== MASTER REGION (REDUX) ===")
			//show_debug_list(_master_region);
			//exit;
		
			//remove the doner region from the available regions list
			ds_list_delete(_region_connectors, i);
			
			//stop checking any further regions..
			break;

		}
	}

	//-------------------------------------------------------------------------

}

//=============================================================================


//keep this REALLY low
var _extra_door_chance = 0.02;

//add a few "extra" doors for flavour
var _all_region_connectors_size = ds_list_size(_all_region_connectors);
for (var i = 0; i < _all_region_connectors_size; i++) {
	if (random(1) < _extra_door_chance) {
		var _cell = unpack_xy(_all_region_connectors[|i]);
		ds_grid_set(_world, _cell[0], _cell[1], TILE_DOOR);
	}
}


//=============================================================================

// destroy all the region data as we no longer need it
for (var i = 0; i < ds_list_size(_regions); i++) {
    ds_list_destroy(ds_list_find_value(_regions, i));
}
ds_list_destroy(_regions);

//and the region connector cells
for (var i = 0; i < ds_list_size(_region_connectors); i++) {
	ds_list_destroy(ds_list_find_value(_region_connectors, i));
}
ds_list_destroy(_region_connectors);

//=============================================================================