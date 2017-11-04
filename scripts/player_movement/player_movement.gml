/// player_movement(entity)
/// Allows a human to control the entity
/// @param entity   Required - The instance of the entity that is being controlled by this logic

//-----------------------------------------------------------------------------

var _entity = argument0;

//-----------------------------------------------------------------------------

//are we trying to move?
var _move_x = (keyboard_check(ord("D")) - keyboard_check(ord("A")));
var _move_y = (keyboard_check(ord("S")) - keyboard_check(ord("W")));

//
if (_move_x != 0 or _move_y != 0 ) {
	
	//
	var _target_x = _entity.current_x + _move_x;
	var _target_y = _entity.current_y + _move_y;

	//if there is an hostile entity in the target square - attack it
	with (obj_entity) {		
		if (current_x == _target_x and current_y == _target_y) {
			scr_perform_attack(_entity, id);
			return true; //end turn
		}
	}

	//test if we are able to move - if so move then allow the turn to end
	if (canEntityMoveToCell(_entity, _target_x, _target_y)) {	
		moveEntityToCell(_entity, _entity.current_x + _move_x, _entity.current_y + _move_y);
		return true; //end turn
	}
	
}

//-----------------------------------------------------------------------------

//cancel the current abilities
if (mouse_check_button_pressed(mb_right) and !instance_position(mouse_x, mouse_y, obj_button)) {
	obj_game.current_entity.action = "";
	obj_mouse.pointer_type = enum_pointer_type.pointer;
}

//check for aimed abilities
if (mouse_check_button_pressed(mb_left) and !instance_position(mouse_x, mouse_y, obj_button)) {
				
	////perform a move action
	//if (_entity.action == "move") {

	//	//get the cell at the mouse position
	//	var _position = getCellAtMouse();

	//	//test if we are able to move - if so move then allow the turn to end
	//	if (canEntityMoveToCell(_entity, _position[0], _position[1])) {
	//		moveEntityToCell(_entity, _position[0], _position[1]);
	//	}

	//	obj_game.current_entity.action = "";
	//	obj_mouse.pointer_type = enum_pointer_type.pointer;
		
	//	if (obj_game.current_entity == id) {
	//		obj_game.current_entity = noone;
	//	}
	//}

	//if an action has been requested (and it's an aimed thing - run the action logic on click)
	if (_entity.action == "cast-magic-arrow" ) {
		castMagicArrow(_entity, mouse_x, mouse_y);
		
		
		_entity.action = "";
		obj_mouse.pointer_type = enum_pointer_type.pointer;
		
		
		//
		return true; //end the turn, but prevent the next turn from starting till the "action" has finished
	}

}

//-----------------------------------------------------------------------------

return false;

//-----------------------------------------------------------------------------