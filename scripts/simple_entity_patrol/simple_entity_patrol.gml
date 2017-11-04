/// random_movement(entity)
/// Move the entity at random, then ends the turn
/// @param entity   Required - The instance of the entity that is being controlled by this logic

//-----------------------------------------------------------------------------

var _entity = argument0;

//-----------------------------------------------------------------------------

//if we are able to see the player - then goto attack mode
if (scr_check_collision_line(_entity.current_x, _entity.current_y, obj_game.player.current_x, obj_game.player.current_y, 10)) {
	_entity.timer_idle = 0; //reset the idle timer
	return scr_change_entity_state(_entity, enum_entity_state.attack);
}

//have we already arrived? - go back to idle
if (_entity.current_x == _entity.target_x and _entity.current_y == _entity.target_y) {

	//reset the target for next time
	_entity.target_x = -1;
	_entity.target_y = -1;

	//change the state to idle
	return scr_change_entity_state(_entity, enum_entity_state.idle);

}

//if we have not got a location to goto - pick one
if (_entity.target_x == -1 or _entity.target_y == -1) {
	
	//attempt to pick a cell to goto
	var _position = getRandomCell(); 

	//if we can navigate to the position - then set this as a target 
	if (scr_get_world_path(_entity.path, _entity.current_x, _entity.current_y, _position[0], _position[1])) {
		_entity.target_x = _position[0];
		_entity.target_y = _position[1];		
	}

}

//evaluate our route each time (turn based so performance here is not a concern - we also have the option to "block" tiles now (wall spell?)
if (_entity.target_x >= 0 and _entity.target_y >= 0) {
	if (scr_get_world_path(_entity.path, _entity.current_x, _entity.current_y, _entity.target_x, _entity.target_y)) {
	
		//get the next tile along the path (convert from game coords to world coords)
		var _target_x = floor(path_get_point_x(_entity.path, 1) / GRID_SIZE);
		var _target_y = floor(path_get_point_y(_entity.path, 1) / GRID_SIZE);
		
		//
		moveEntityToCell(_entity, _target_x, _target_y);
		return true;
		
	}
}

//-----------------------------------------------------------------------------

//end the turn
return true;

//-----------------------------------------------------------------------------