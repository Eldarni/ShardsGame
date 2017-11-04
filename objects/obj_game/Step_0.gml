



//
switch (game_state) {

	
	//--------------------------------------------------------------------------------
	case game_state.initialize:

		#region ==== INITIALIZE ======================================================

		////create an instance of the "level" that we are on
		//level = instance_create_layer(-32, 0, "Instances", obj_level1);

		////initilize the level based on the settings in the level object
		//scr_initialize_level(level);

		////move the game into the "playing" mode
		//game_state = game_state.start_round;

		#endregion

	break;
	//--------------------------------------------------------------------------------
	

	//--------------------------------------------------------------------------------
	case game_state.start_round:

		#region ==== START ROUND =====================================================

		//show_debug_message("-----------------------------");
		//show_debug_message("==== STARTING ROUND " + string(current_round) + " ====");



		//update the grids resposible for keeping track of the explored and visible tiles
		scr_update_player_sight(player, 6);

		//age all the "visible" tiles
		ds_grid_add_region(level.ds_visible, 0, 0, (level.level_width - 1), (level.level_height -1), -1);

		//update the visibility tilemap to show the correct tiles
		for (var xx = 0; xx < (level.level_width - 1); xx++) {
			for (var yy = 0; yy < (level.level_height -1 ); yy++) {
									
				//
				var tile = tilemap_get(visibility, xx, yy);
									
				if (level.ds_explored[# xx, yy] == 1) {
					tilemap_set(visibility, tile_set_index(tile, 1), xx, yy);	
				}
									
				if (level.ds_visible[# xx, yy] > 0) {
					tilemap_set(visibility, tile_set_index(tile, 0), xx, yy);	
				}
	
			}	
				
		}
		
		//create a priority queue to keep track of the entities waiting to take their turn (ordered by their initiative)
		turn_order = ds_priority_create();

		//get the initiative of each entity and add them to the priority queue
		with (obj_entity) {
			ds_priority_add(other.turn_order, id, getInitiative(id));			
		}

		//
		current_turn = -1;
		current_entity = noone;
				
		//
		game_state = game_state.execute_round;
		
		#endregion

	break;
	//--------------------------------------------------------------------------------

	//--------------------------------------------------------------------------------
	case game_state.execute_round:

		#region ==== EXECUTE ROUND ===================================================

		//
		while (ds_priority_size(turn_order) > 0) {
			
			//find the entity thats next due a turn
			current_entity = ds_priority_find_max(turn_order);
			
			//confirm that they have not been killed - and its a valid entity - @todo why is this sometimes giving invalid entities
			if (current_entity > 0 and !instance_exists(current_entity)) {
				current_entity = noone;
			}
			
			//execute the relevent "action" logic for the entity (again, confirm it's a valid entity)
			if (current_entity != noone and object_is_ancestor(current_entity.object_index, obj_entity)) {
				
				//execute the relevent "action" logic for the entity, if this return false, then break out of the loop allowing the game to carry on a step (used by player logic/animations)
				if (script_execute(current_entity.entity_logic[current_entity.entity_state], current_entity) == false) {
					break;
				}	
				
				//remove the entity from the turn queue as it has finished the it's turn
				ds_priority_delete_value(turn_order, current_entity);
				current_entity = noone;
			}	
			
			//if the priority queue is empty - end the round
			if (ds_priority_size(turn_order) == 0) {
				game_state = game_state.end_round;	
			}
			
		}
		
		#endregion
	
	break;
	//--------------------------------------------------------------------------------

	//--------------------------------------------------------------------------------	
	case game_state.end_round:

		#region ==== END ROUND =======================================================
		
		//show_debug_message("==== Ending Round ====");
		
		//kill the old turn order data - we will reinitialize this next round
		ds_priority_destroy(turn_order);
		
		//perform the regen health and enegy stuff
		with (obj_entity) {
			stats_health = clamp((stats_health + (stats_max_health * stats_health_regen)), 0, stats_max_health);
			stats_energy = clamp((stats_energy + (stats_max_energy * stats_energy_regen)), 0, stats_max_energy);
		}

		//increment the round counter....	
		current_round  += 1;
			
		//return to the start of the game loop
		game_state = game_state.start_round;
		
		#endregion
		
	break;
	//--------------------------------------------------------------------------------

}


//--------------------------------------------------------------------------------

//do some general "game" stuff

//toggle full screen display
if (keyboard_check_pressed(vk_f11)) {
	window_set_fullscreen(!window_get_fullscreen());
}



//open the map window
if (keyboard_check_pressed(ord("M"))) {
	scr_toggle_window(obj_map_window);
}




//--------------------------------------------------------------------------------









