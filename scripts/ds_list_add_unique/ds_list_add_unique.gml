/// ds_list_add_unique(id, value)
/// Add an item to a list - unless it already has been added
/// @param id
/// @param value

//-----------------------------------------------------------------------------

var _id    = argument0;
var _value = argument1;

//-----------------------------------------------------------------------------

if (ds_list_find_index(_id, _value) == -1) {
	ds_list_add(_id, _value);
}

//-----------------------------------------------------------------------------