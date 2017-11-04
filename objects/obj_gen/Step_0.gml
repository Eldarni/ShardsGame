/// @description Insert description here
// You can write your code in this editor




if (mouse_check_button_pressed(mb_left)) {
	
	//var _world_map = layer_tilemap_get_id(layer_get_id("World"));

	//var map_width =  tilemap_get_width(_world_map) - 1;
	//var map_height = tilemap_get_height(_world_map) - 1;

	////convert the map into the screen visible tiles
	//for (var xx = 0; xx < map_width; xx++) {
	//	for (var yy = 0; yy < map_height; yy++) {

	//		var tile = tilemap_get(_world_map, xx, yy);	
	//		tilemap_set(_world_map, tile_set_index(tile, 0), xx, yy);		
		
	//	}	
	//}










	//ds_grid_destroy(_world);

	game_restart();
}

/*
if (mouse_check_button_pressed(mb_left)) {

	var cellx = floor(mouse_x / GRID_SIZE);
	var celly = floor(mouse_y / GRID_SIZE);



	var tile = tilemap_get(world_map, cellx, celly);
	
	
	//tile_get_index(tile)
	
	tile = tile_set_index(tile, 2); //change the tike
	//tile = tile_set_rotate(tile, true); //rotate to its side
	//tile = tile_set_flip(tile, true); //flip y
	//tile = tile_set_mirror(tile, true);
	
	tilemap_set(world_map, tile, cellx, celly);



	//show_debug_message("TILE: " + string(tile_get_index(tile)));
	
	
	
	//tilemap_set(tilemap_element_id, tiledata, xcell, ycell)
	
}
*/