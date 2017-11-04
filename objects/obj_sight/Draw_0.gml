///// @description Insert description here
//// You can write your code in this editor
//var cx = obj_game.player.current_x;
//var cy = obj_game.player.current_y;

//var cr = 6;


//draw_set_color(c_red);

////loop throught each tile that is in a radius around a central tile
//for (yy = cy-cr; yy <= cy+cr; yy++){
//    for (xx = cx-cr; xx <= cx+cr; xx++) {
//        if ((xx - cx)*(xx-cx) + (yy-cy)*(yy-cy) < cr*cr) {

//			//draw a line from each player corner to each tile corner...
//			if (scr_check_collision_line(cx, cy, xx, yy, 10) == true) {
//				draw_set_color(c_lime);
//				draw_rectangle(xx * GRID_SIZE, yy * GRID_SIZE, xx * GRID_SIZE + GRID_SIZE, yy * GRID_SIZE + GRID_SIZE, true);			
//			}

//        }
//    }
//}



//draw_set_colour(c_white)