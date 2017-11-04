/// simple_entity_idle(entity)
/// The entity stands still while idle
/// @param entity   Required - The instance of the entity that is being controlled by this logic

//-----------------------------------------------------------------------------

var _entity = argument0;

//-----------------------------------------------------------------------------

//increment our entities idle timer, the higher this is the "bigger" the change we shall go patrol
_entity.timer_idle += 1;

//if we are able to see the player - then goto attack mode
if (scr_check_collision_line(_entity.current_x, _entity.current_y, obj_game.player.current_x, obj_game.player.current_y, 10)) {
	_entity.timer_idle = 0; //reset the idle timer
	return scr_change_entity_state(_entity, enum_entity_state.attack);
}

//
if (_entity.timer_idle > random(500)) {
	_entity.timer_idle = 0; //reset the idle timer
	return scr_change_entity_state(_entity, enum_entity_state.patrol);
}

//-----------------------------------------------------------------------------

//end the turn
return true;

//-----------------------------------------------------------------------------