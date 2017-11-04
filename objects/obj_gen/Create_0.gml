/// @description Generates a new map

//-----------------------------------------------------------------------------

//basic cardinal directions
#macro DIR_E 0
#macro DIR_N 90
#macro DIR_W 180
#macro DIR_S 270

//basic tile types to use while creating the base map
#macro TILE_VOID 1
#macro TILE_ROOM 2
#macro TILE_HALL 3
#macro TILE_WALL 4
#macro TILE_DOOR 5
#macro TILE_REGION 6



//-----------------------------------------------------------------------------

randomize();

//-----------------------------------------------------------------------------

//
var _world_tilemap = layer_tilemap_get_id(layer_get_id("World"));

//get the size of the tilemapo - this will define our room size
var _world_tilemap_width =  tilemap_get_width(_world_tilemap);
var _world_tilemap_height = tilemap_get_height(_world_tilemap);

//-----------------------------------------------------------------------------

//decide if we should load from a save or create a new one (@todo)
var _world = scr_map_generate(_world_tilemap_width, _world_tilemap_height);








//---------------------------------------------------------------
// this code will test the generation by rendering it

show_debug_message("RENDERING MAP: ");

//
var black  = 55;
var red    = 56;
var pink   = 57;
var purple = 58;
var dblue  = 59;
var lblue  = 60;
var green  = 61;
var yellow = 62;
var orange = 63;

//convert the map into the screen visible tiles
for (var xx = 0; xx < _world_tilemap_width; xx++) {
	for (var yy = 0; yy < _world_tilemap_height; yy++) {

		var tile = tilemap_get(_world_tilemap, xx, yy);
			
		switch (_world[# xx, yy]) {
			case TILE_VOID: tile = tile_set_index(tile, black);  break;
			case TILE_ROOM: tile = tile_set_index(tile, lblue);  break;
			case TILE_HALL: tile = tile_set_index(tile, yellow); break;
			case TILE_WALL: tile = tile_set_index(tile, red);    break;
			case TILE_DOOR: tile = tile_set_index(tile, dblue);  break;
			
			case TILE_REGION: tile = tile_set_index(tile, purple);  break;
		}
		
		tilemap_set(_world_tilemap, tile, xx, yy);		
		
	}	
}

//destroy the world data... temp we will want to keep this
ds_grid_destroy(_world);

