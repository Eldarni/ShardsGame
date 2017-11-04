/// random_movement(entity)
/// Move the entity at random, then ends the turn
/// @param entity   Required - The instance of the entity that is being controlled by this logic

//-----------------------------------------------------------------------------

var _entity = argument0;

//-----------------------------------------------------------------------------

//declare our cardinal and intercardinal directions as movement options
directions[0] = [ 0, -1]; //N
directions[1] = [ 1, -1]; //NE
directions[2] = [ 1,  0]; //E
directions[3] = [ 1,  1]; //SE
directions[4] = [ 0,  1]; //S
directions[5] = [-1,  1]; //SW
directions[6] = [-1,  0]; //W
directions[7] = [-1, -1]; //NW

//try to move 10 times before giving up
for (var ii = 0; ii < 10; ii++) {

	//pick a random direction - N, NE, E, SE, S, SW, W, NW
	var move = directions[irandom(7)];

	var _target_x = _entity.current_x + move[0];
	var _target_y = _entity.current_y + move[1];

	//test if we are able to move - if so move then allow the turn to end
	if (canEntityMoveToCell(_entity, _target_x, _target_y)) {
		moveEntityToCell(_entity, _target_x, _target_y);
		break;
	}

}

//end the turn
return true;