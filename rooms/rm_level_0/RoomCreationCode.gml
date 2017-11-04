
//==============================================================================
	
//create an world instance to hold our terrain/onsters/items etc
obj_game.level = instance_create_layer(-32, 0, "Instances", obj_world);

//==============================================================================

//How big should this level be - calculate it from the rooms size
obj_game.level.level_width  = floor(room_width  / GRID_SIZE);
obj_game.level.level_height = floor(room_height  / GRID_SIZE);

//-----------------------------------------------------------------------------

//what level generator to use - if any (set this to noone to skip world generation)
obj_game.level.level_generation = scr_map_generate;

//------------------------------------------------------------------------------

//What monsters should we spawn (spawn random level appropiate monsters)
obj_game.level.spawn[0]  = obj_entityBat;
obj_game.level.spawn[1]  = obj_entityBat;
obj_game.level.spawn[2]  = obj_entityBat;
obj_game.level.spawn[3]  = obj_entityBat;
obj_game.level.spawn[4]  = obj_entityBat;
obj_game.level.spawn[5]  = obj_entityBat;
obj_game.level.spawn[6]  = obj_entitySkeleton;
obj_game.level.spawn[7]  = obj_entitySkeleton;
obj_game.level.spawn[8]  = obj_entitySkeleton;
obj_game.level.spawn[9]  = obj_entitySkeleton;
obj_game.level.spawn[10] = obj_entitySkeleton;
obj_game.level.spawn[11] = obj_entitySkeleton;
obj_game.level.spawn[12] = obj_entity_giantRat;
obj_game.level.spawn[13] = obj_entity_giantRat;
obj_game.level.spawn[14] = obj_entity_giantRat;

//------------------------------------------------------------------------------

//What items should we spawn (spawn random level appropiate items)







//==============================================================================

//initilize the level based on the settings in the level object
scr_generate_world(obj_game.level);
scr_render_world(obj_game.level);
scr_populate_world(obj_game.level);

//move the game into the "playing" mode
obj_game.game_state = game_state.start_round;

//==============================================================================