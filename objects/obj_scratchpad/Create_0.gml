/// @description Insert description here
// You can write your code in this editor

var xx = 1337;
var yy = 59;

var packed = pack_xy(xx, yy);

show_debug_message("x: "+ string(xx))
show_debug_message("y: "+ string(yy))

show_debug_message("xy: "+ string(packed))


show_debug_message("xy: "+ string(unpack_xy(packed)))
