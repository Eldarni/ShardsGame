/// scr_render_world(world)

//-----------------------------------------------------------------------------

var _world = argument0;

//-----------------------------------------------------------------------------

//initialize the exploration and visibility grids
_world.ds_explored = ds_grid_create(_world.level_width, _world.level_height);
_world.ds_visible  = ds_grid_create(_world.level_width, _world.level_height);

//-----------------------------------------------------------------------------

//convert the world map into the screen visible tiles - should these changes be made to the ds_world - then rendered?
for (var xx = 0; xx < (_world.level_width - 1); xx++) {
	for (var yy = 0; yy < (_world.level_height -1 ); yy++) {

		var tile = tilemap_get(obj_game.world, xx, yy);
			
		switch (_world.ds_world[# xx, yy]) {
			case TILE_VOID:   tile = tile_set_index(tile, irandom_range( 1, 12));  break;
			case TILE_DOOR:   tile = tile_set_index(tile, irandom_range(17, 18));  break;
			case TILE_REGION: tile = tile_set_index(tile, irandom_range(13, 16));  break;
		}
		
		tilemap_set(obj_game.world, tile, xx, yy);	
		
		//make it collidabel if it is a void cell
		if (_world.ds_world[# xx, yy] == TILE_VOID) {
			
			//make it collidable ----
			var tile = tilemap_get(obj_game.collider, xx, yy);
			tilemap_set(obj_game.collider, tile_set_index(tile, 1), xx, yy);

		}
		
	}	
				
}

//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------

