/// simple_melee_attack(entity)
/// Path to the player - and never give up
/// @param entity   Required - The instance of the entity that is being controlled by this logic

//-----------------------------------------------------------------------------

var _entity = argument0;

//-----------------------------------------------------------------------------

//get the players position @todo combine this with a sight check or other stuff
var _player_x = obj_game.player.x;
var _player_y = obj_game.player.y;

//can we path to the player?
if (mp_grid_path(obj_game.level.mp_navigation, _entity.path, _entity.x, _entity.y, _player_x, _player_y, true)) {

	//get the next tile along the path (convert from game coords to world coords)
	var _target_x = floor(path_get_point_x(_entity.path, 1) / GRID_SIZE);
	var _target_y = floor(path_get_point_y(_entity.path, 1) / GRID_SIZE);
	
	//if there is an hostile entity in the target square - attack it
	with (obj_entity) {		
		if (current_x == _target_x and current_y == _target_y) {
			scr_perform_attack(_entity, id);
			return true; //end turn
		}
	}
	
	
	//test if we are able to move - if so move then allow the turn to end
	if (canEntityMoveToCell(_entity, _target_x, _target_y)) {
		moveEntityToCell(_entity, _target_x, _target_y);
		return true;
	}
		
}

	

//no path found - return to idle??


//end the turn
return true;