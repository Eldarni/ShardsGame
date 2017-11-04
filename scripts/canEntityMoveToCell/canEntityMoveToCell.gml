/// canEntityMoveToCell(entity, target_x, target_y)
/// Checks to see if the entity is able to "move" to the target position
/// @param entity
/// @param target_x
/// @param target_y

//-----------------------------------------------------------------------------

var _entity   = argument0;
var _target_x = argument1;
var _target_y = argument2;

//-----------------------------------------------------------------------------

//
collision_map = layer_tilemap_get_id(layer_get_id("Collider"));

//
if (!tilemap_get_at_pixel(collision_map, _target_x * GRID_SIZE, _target_y * GRID_SIZE) & tile_index_mask) {
	return true;
}

return false;