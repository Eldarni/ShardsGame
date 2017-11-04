

//



screen_w = window_get_width();
screen_h = window_get_height();


//draw health and magic bars - temp....
var health_percent = (100 / player.stats_max_health) * player.stats_health;
var energy_percent = (100 / player.stats_max_energy) * player.stats_energy;

//
x1 = x - sprite_xoffset;
x2 = x1 + sprite_width;
y1 = y + sprite_yoffset;

//draw the health and magic bars
draw_healthbar(16, 16, 116, 26, health_percent, c_black, c_green, c_green, 0, true, false);
draw_healthbar(16, 30, 116, 40, energy_percent, c_black, c_blue, c_blue, 0, true, false);