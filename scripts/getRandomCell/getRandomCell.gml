/// getRandomCell()
/// Gets a random non colliding cell @todo will require better "spawning" code
/// Does not work properly - but "good enough" to test with for now
//-----------------------------------------------------------------------------

//no input arguments

//-----------------------------------------------------------------------------

//
collision_map = layer_tilemap_get_id(layer_get_id("Collider"));

while (true) {

	var _target_x = irandom_range(0, (tilemap_get_width(collision_map) - 1));
	var _target_y = irandom_range(0, (tilemap_get_height(collision_map) - 1));
	
	if (!tilemap_get_at_pixel(collision_map, _target_x * GRID_SIZE, _target_y * GRID_SIZE) & tile_index_mask) {
		return [_target_x, _target_y];
	}
}