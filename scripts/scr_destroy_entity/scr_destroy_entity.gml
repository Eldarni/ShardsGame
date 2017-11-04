/// scr_destroy_entity(_entity)
/// Populate the world with the initial batch of monsters and items

//-----------------------------------------------------------------------------

var _entity = argument0;

//-----------------------------------------------------------------------------

//check to see if the game controller is running - if not we have issues...
if (instance_exists(obj_game)) {
	
	//remove the entity from the turn queue (if the queu exists)
	if (ds_exists(obj_game.turn_order, ds_type_priority)) {
		ds_priority_delete_value(obj_game.turn_order, _entity);
	}
	
	//if this is the "current entity" then set that to "noone"
	if (obj_game.current_entity == _entity) {
		obj_game.current_entity = noone;
	}

}

//now destroy the instance
instance_destroy(_entity);

//-----------------------------------------------------------------------------



