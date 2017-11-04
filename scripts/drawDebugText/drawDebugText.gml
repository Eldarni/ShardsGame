/// drawDebugText(x, y, t, c1, c2)
/// Draws text (t) at the specified position using the defined colours
/// @param x
/// @param y
/// @param text
/// @param c1
/// @param c2


//-----------------------------------------------------------------------------

var _x  = argument0;
var _y  = argument1;
var _t  = argument2;
var _c1 = argument3;
var _c2 = argument4;

//-----------------------------------------------------------------------------

//get the origional colour so that we can return to it later
var _c0 = draw_get_colour();

//draw the background
draw_set_colour(_c1);
draw_rectangle(_x, _y, _x + string_width(_t), _y + string_height(_t), false);

//draw the text
draw_set_colour(_c2);
draw_text(_x, _y, _t);

//return everything to default
draw_set_colour(_c0);

//-----------------------------------------------------------------------------