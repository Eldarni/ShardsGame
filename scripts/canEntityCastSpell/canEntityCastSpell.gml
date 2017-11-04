/// canEntityCastSpell(caster, spell, cost)
/// Checks to see if the caster can cast a specific spell
/// @param caster   Required - The instance of the entity casting the spell
/// @param spell    Required - the name of the spell
/// @param cost     Required - How much magic this spell takes

//-----------------------------------------------------------------------------

var _caster = argument0;
var _spell  = argument1;
var _cost   = argument2;

//-----------------------------------------------------------------------------

if (_caster.stats_energy >= _cost) {
	return true;
}
return false;

//-----------------------------------------------------------------------------