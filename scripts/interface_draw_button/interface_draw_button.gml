/// canEntityCastSpell(x, y, action, text, description)
/// Checks to see if the caster can cast a specific spell


//-----------------------------------------------------------------------------

var _x           = argument0;
var _y           = argument1;
var _action      = argument2;
var _text        = argument3;
var _description = argument4;

//-----------------------------------------------------------------------------

//quick buttons to debug/do stuff
with (instance_create_layer(0, 0, "Interface", obj_button)) {
	
	//set the button's params up
	button_name        = _text;
	button_description = _description;
	button_action      = _action;
	
	//button position
	button_x = _x;
	button_y = _y;
	
	//resize the sprite so it will fit the text on it
	image_xscale = (string_width(button_name) + 4) / sprite_width;
	image_yscale = (string_height(button_name) + 4) / sprite_height;

}

//-----------------------------------------------------------------------------
