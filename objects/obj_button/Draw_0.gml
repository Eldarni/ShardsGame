
//position the button relative to the view - would this be better called once? and globalled
x = camera_get_view_x(view_camera[0]) + button_x;
y = camera_get_view_y(view_camera[0]) + button_y;

//draw the button
draw_self();

//get the origional colour so that we can return to it later
var colour = draw_get_colour();

//draw the text
draw_set_colour(c_white);
draw_text(x + 1, y + 1, button_name);

//return everything to default
draw_set_colour(colour);
