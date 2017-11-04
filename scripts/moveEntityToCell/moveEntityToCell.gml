/// moveEntityToCell(entity, target_x, target_y)
/// Moves the supplied entity to the target cell
/// @param entity
/// @param target_x
/// @param target_y

//-----------------------------------------------------------------------------

var _entity   = argument0;
var _target_x = argument1;
var _target_y = argument2;

//-----------------------------------------------------------------------------

//set the entities position to the cell - and update anything else etc
_entity.current_x = _target_x;
_entity.current_y = _target_y;
