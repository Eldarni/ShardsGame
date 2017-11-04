/// spawnNewEntity(type, x, y)
/// Checks to see if the caster can cast a specific spell
/// @param caster   Required - The instance of the entity casting the spell
/// @param spell    Required - the name of the spell
/// @param cost     Required - How much magic this spell takes

//-----------------------------------------------------------------------------

var _type = argument0;
var _x    = argument1;
var _y    = argument2;

//-----------------------------------------------------------------------------

//
var _entity = instance_create_layer(_x * GRID_SIZE + (GRID_SIZE / 2), _y * GRID_SIZE + (GRID_SIZE / 2), "Instances", _type);

//store the position inside the entity
_entity.current_x = _x;
_entity.current_y = _y;

return _entity;

//-----------------------------------------------------------------------------