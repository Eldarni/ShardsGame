/// scr_update_player_sight(entity, range)

//-----------------------------------------------------------------------------

var _entity = argument0;
var _range = argument1;

//-----------------------------------------------------------------------------

var cx = _entity.current_x;
var cy = _entity.current_y;

//loop throught each tile that is in a radius around a central tile
for (yy = cy-_range; yy <= cy+_range; yy++){
    for (xx = cx-_range; xx <= cx+_range; xx++) {
        if ((xx - cx)*(xx-cx) + (yy-cy)*(yy-cy) < _range*_range) {
			//-----------------------------------------------------------------------------

			//
			if (scr_check_collision_line(cx, cy, xx, yy, 10) == true) {
				
				//
				obj_game.level.ds_explored[# xx, yy] = 1;
				obj_game.level.ds_visible[#  xx, yy] = 5;
				
				//and update any wall cells that are next to the seen tile
				var xxw = xx - 1, xxe = xx + 1;
				var yyn = yy - 1, yys = yy + 1;

				//top - left
				if (tilemap_get(obj_game.collider, xxw, yyn) & tile_index_mask) {
					obj_game.level.ds_explored[# xxw, yyn] = 1;
					 obj_game.level.ds_visible[# xxw, yyn] = 5;
				}

				//top
				if (tilemap_get(obj_game.collider, xx, yyn) & tile_index_mask) {
					  obj_game.level.ds_explored[# xx, yyn] = 1;
					   obj_game.level.ds_visible[# xx, yyn] = 5;
				}

				//top - right
				if (tilemap_get(obj_game.collider, xxe, yyn) & tile_index_mask) {
					  obj_game.level.ds_explored[# xxe, yyn] = 1;
					   obj_game.level.ds_visible[# xxe, yyn] = 5;
				}

				//left
				if (tilemap_get(obj_game.collider, xxw, yy) & tile_index_mask) {
					  obj_game.level.ds_explored[# xxw, yy] = 1;
					   obj_game.level.ds_visible[# xxw, yy] = 5;
				}	

				//right
				if (tilemap_get(obj_game.collider, xxe, yy) & tile_index_mask) {
					  obj_game.level.ds_explored[# xxe, yy] = 1;
					   obj_game.level.ds_visible[# xxe, yy] = 5;
				}	

				//bottom - left
				if (tilemap_get(obj_game.collider, xxw, yys) & tile_index_mask) {
					  obj_game.level.ds_explored[# xxw, yys] = 1;
					   obj_game.level.ds_visible[# xxw, yys] = 5;
				}	

				//bottom
				if (tilemap_get(obj_game.collider, xx, yys) & tile_index_mask) {
					  obj_game.level.ds_explored[# xx, yys] = 1;
					   obj_game.level.ds_visible[# xx, yys] = 5;
				}	

				//bottom - right
				if (tilemap_get(obj_game.collider, xxe, yys) & tile_index_mask) {
					  obj_game.level.ds_explored[# xxe, yys] = 1;
					   obj_game.level.ds_visible[# xxe, yys] = 5;
				}	
					
			}
			
			//-----------------------------------------------------------------------------

        }
    }
}

//-----------------------------------------------------------------------------