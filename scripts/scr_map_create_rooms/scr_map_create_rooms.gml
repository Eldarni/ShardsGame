/// scr_map_create_rooms(world, attempts, min_size, max_size)
/// Checks to see if the entity is able to "move" to the target position
/// @param world    - The ds_grid representing the current world
/// @param attempts - How many times should a room be attempted
/// @param min_size - What is the smallest a room can be
/// @param max_size - what is the biggest a room can be (the rectangularization will break this rule)

//-----------------------------------------------------------------------------

var _world              = argument0;
var _attempts           = argument1;
var _min_base_room_size = argument2;
var _max_base_room_size = argument3;

//-----------------------------------------------------------------------------

//get the size of the world - so we can position the rooms within it
var _world_width  = (ds_grid_width(_world) - 2);
var _world_height = (ds_grid_height(_world) - 2);

//generate as many rooms as we can (most attempts will fail - especially later in the generation)
for (var i = 0; i < _attempts; i++) {

	var _width  = irandom_odd_range(_min_base_room_size, _max_base_room_size);
	var _height = irandom_odd_range(_min_base_room_size, _max_base_room_size);     
			
    //should we add a bit to a side (further increases the chances of rectangle rooms - also increases chances of t and l shaped rooms)
    switch (irandom(1)) {
        case 0: _width  += irandom_even_range(2, 4); break;
        case 1: _height += irandom_even_range(2, 4); break;
    }

	//position the room at random in the map
	var _x = irandom_odd_range(1, (_world_width  - _width));
	var _y = irandom_odd_range(1, (_world_height - _height));

	var _room_xmin = _x;
	var _room_xmax = _x + _width - 1;
	var _room_ymin = _y;
	var _room_ymax = _y + _height - 1;

	//check to see if we are allowed to place the room here (only check corners to allow some overlaps) (maybe allow 1 corner to overlap?)
	if (ds_grid_get(_world, _room_xmin, _room_ymin) != TILE_VOID) { continue; }
	if (ds_grid_get(_world, _room_xmin, _room_ymax) != TILE_VOID) { continue; }
	if (ds_grid_get(_world, _room_xmax, _room_ymin) != TILE_VOID) { continue; }
	if (ds_grid_get(_world, _room_xmax, _room_ymax) != TILE_VOID) { continue; }
		
	//as we have passed the collision checks - add the room to the map
	ds_grid_set_region(_world, _room_xmin, _room_ymin, _room_xmax, _room_ymax, TILE_ROOM);

}


//-----------------------------------------------------------------------------
