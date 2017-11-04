//get the collision map
tilemap = layer_tilemap_get_id(layer_get_id("Collider"));

//store who fired the arrow so we can ignore them for collisions
caster = noone;

//start the arrow moving
target_x = 0;
target_y = 0;

//have we started the thing
initialized = false;

//target_x = mouse_x + random_range(-10, 10);
//target_y = mouse_y + random_range(-10, 10);




