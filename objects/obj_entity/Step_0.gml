
//-----------------------------------------------------------------------------

//render the entity at the tile it is "at"
x = current_x * GRID_SIZE + sprite_xoffset;
y = current_y * GRID_SIZE + sprite_yoffset;	

//-----------------------------------------------------------------------------

//kill the entity when the health is below 0
if (stats_health <= 0) {
	show_debug_message(creature_race + " has been killed");
	scr_destroy_entity(id);
}

//-----------------------------------------------------------------------------