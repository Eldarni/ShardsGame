/// scr_change_entity_state(entity, state)
/// Changes the current entities state - remember to reset any state specific information

//-----------------------------------------------------------------------------

var _entity = argument0;
var _state  = argument1;

//-----------------------------------------------------------------------------

//update the entities state
_entity.entity_state = _state;

//execute the new state logic
return script_execute(_entity.entity_logic[_state], _entity);

//-----------------------------------------------------------------------------