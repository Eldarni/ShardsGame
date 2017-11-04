/// scr_perform_attack(attacker, defender)
/// Attempt to use the default weapon to attack the target

//-----------------------------------------------------------------------------

var _attacker = argument0;
var _defender = argument1;

//-----------------------------------------------------------------------------

//attack is (attribute_str + weapon damage) * weapon_modifier -- for now
if (_attacker.equipped_weapon != noone) {
	var _base_attack = (_attacker.attribute_str + _attacker.equipped_weapon.damage_value) * _attacker.equipped_weapon.damage_modifier;
}
else
{
	var _base_attack = _attacker.attribute_str * 1.5; //add a modifier for unarmed combat...
}

//defence = attribute_con + armour
var _base_defence = _defender.attribute_con; //armour  is not implemented yet

//also do hit chance, and resists etc

//roll for attack + defence - add some basic random
var _roll_attack = irandom_range(-3, 3);
var _roll_defence = irandom_range(-3, 3);

//
var damage = max(0, (_base_attack + _roll_attack) - (_base_defence + _roll_defence))

//simple attacks can always be made - just perform a basic combat roll and deduct the appropiate amount of health
_defender.stats_health -= damage

//
scr_log_event("ENTITY_SIMPLE_ATTACK", _attacker.creature_race, _defender.creature_race, damage);

//-----------------------------------------------------------------------------