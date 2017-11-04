/// scr_populate_world(world)
/// Populate the world with the initial batch of monsters and items

//-----------------------------------------------------------------------------

var _world = argument0;

//-----------------------------------------------------------------------------

//spawn our hero - handle this somewhere else
var _position = getRandomCell();
obj_game.player = spawnNewEntity(obj_hero, _position[0], _position[1]);

//-----------------------------------------------------------------------------

//spawn the defined entities - @todo add some random stuff (object pools etc)
for (var ii = 0; ii < array_length_1d(_world.spawn); ii++) {
	var _position = getRandomCell(); //not always returning a valid position
	spawnNewEntity(_world.spawn[ii], _position[0], _position[1]);
}

//-----------------------------------------------------------------------------