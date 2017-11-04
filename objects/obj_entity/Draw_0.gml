
//------------------------------------------------------------------------------

//
draw_self();

//------------------------------------------------------------------------------

////debug the path
//if (path_get_number(path) > 0) {
//	draw_path(path, x, y, true);
//	for (var i = 0; i < path_get_number(path); i++) {
//		draw_circle(path_get_point_x(path, i), path_get_point_y(path, i), 2, false)
//	}
//}

//------------------------------------------------------------------------------

//draw a symbol to indicate the state (debugging?)
draw_set_colour(c_red);
switch (entity_state) {
	case enum_entity_state.idle:   draw_text(x - 3, y - 32, "I"); break;
	case enum_entity_state.patrol: draw_text(x - 3, y - 32, "W"); break;
	case enum_entity_state.panic:  draw_text(x - 3, y - 32, "P"); break;
	case enum_entity_state.attack: draw_text(x - 3, y - 32, "A"); break;
	case enum_entity_state.flee:   draw_text(x - 3, y - 32, "F"); break;
}
draw_set_colour(c_white);

//------------------------------------------------------------------------------

//draw health and magic bars - temp....
var health_percent = (100 / stats_max_health) * stats_health;
var energy_percent = (100 / stats_max_energy) * stats_energy;

//
x1 = x - sprite_xoffset;
x2 = x1 + sprite_width;
y1 = y + sprite_yoffset;

//draw the health and magic bars
draw_healthbar(x1, y1 + 1, x1 + sprite_width, y1 + 3, health_percent, c_black, c_green, c_green, 0, true, false);
draw_healthbar(x1, y1 + 5, x1 + sprite_width, y1 + 7, energy_percent, c_black, c_blue,  c_blue, 0, true, false);

//------------------------------------------------------------------------------