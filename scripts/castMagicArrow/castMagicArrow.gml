/// castMagicArrow(caster, target_x, target_y)
/// Causes the caster to cast majic arrow - depletes the mana reserve as appropiate
/// @param caster   Required - The instance of the entity casting the spell
/// @param target_x Required - 
/// @param target_y Required - 

// @todo - should this target a specified entity or to a location - this is a game design choice that will really matter

//-----------------------------------------------------------------------------

var _caster   = argument0;
var _target_x = argument1;
var _target_y = argument2;

//-----------------------------------------------------------------------------

//store some of this as config?
var spell_name = "spellMagicArrow";
var spell_cost = 5;

//check to see if the caster *can* cast this spell (for now they must have enough magic)
if (canEntityCastSpell(_caster, spell_name, spell_cost)) {

	//
	_caster.stats_energy -= spell_cost;

	//
	with (instance_create_layer(_caster.x, _caster.y, "Effects", obj_arrow)) {
		caster   = _caster;
		target_x = _target_x;
		target_y = _target_y;
	}
}

//-----------------------------------------------------------------------------