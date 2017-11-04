
//
if (other != caster) {
	with (other) {
		stats_health -= 10 + random_range(-8, 8);
	}
	obj_game.current_entity = noone;
	instance_destroy();
}