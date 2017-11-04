
//-----------------------------------------------------------------------------


//define some useful constants
#macro GRID_SIZE 32

//-----------------------------------------------------------------------------

//basic cardinal directions
#macro DIR_E 0
#macro DIR_N 90
#macro DIR_W 180
#macro DIR_S 270

//basic tile types to use while creating the base map
#macro TILE_VOID 1
#macro TILE_ROOM 2
#macro TILE_HALL 3
#macro TILE_WALL 4
#macro TILE_DOOR 5
#macro TILE_REGION 6

//-----------------------------------------------------------------------------

enum game_state {
	initialize,
	start_round,
	execute_round,
	end_round,
}

enum enum_entity_state {
	idle,
	wander,
	panic,
	attack,
	flee,
	patrol,
}

//start the room in it's "initilisation" state
game_state = game_state.initialize;

//-----------------------------------------------------------------------------

//randomize all the things
//random_set_seed(123456789);
randomize();

//-----------------------------------------------------------------------------

//create the "mouse" and "camara" object in the interface layer
instance_create_layer(x, y, "Interface", obj_mouse);
instance_create_layer(x, y, "Interface", obj_camara);
instance_create_layer(x, y, "Interface", obj_history);

/////////////////////////////////////////////

//store the "level" object that defines the level
level    = noone;

//store a reference to our useful tilemaps
world      = layer_tilemap_get_id(layer_get_id("World"));
collider   = layer_tilemap_get_id(layer_get_id("Collider"));
visibility = layer_tilemap_get_id(layer_get_id("Visibility"));

//
windows = ds_map_create();

//reference the main player character
player = noone;

/////////////////////////////////////////////




//position the button relative to the view - would this be better called once? and globalled
xx = camera_get_view_width(view_camera[0]) / 2
yy = camera_get_view_height(view_camera[0]) - 40;

interface_draw_button(xx + 80,  yy - 30, scr_action_cast_spell, "Spell: Magic Arrow", "");
interface_draw_button(xx + 80,  yy,      scr_action_cast_spell, "Spell: Heal", "");






/////////////////////////////////////////////

old_current_entity = noone;
current_entity = noone;
current_round  = 0;
current_turn   = 0;
