
//start the arrow moving to it's target
if (initialized == false) {
	move_towards_point(target_x, target_y, 16);
	image_angle = point_direction(x, y, target_x, target_y);
	initialized = true;
}

//check to see if we have collided with any unpassable terrain
if (tilemap_get_at_pixel(tilemap, x, y) & tile_index_mask) {
	obj_game.current_entity = noone; //end the current turn
	instance_destroy();
}