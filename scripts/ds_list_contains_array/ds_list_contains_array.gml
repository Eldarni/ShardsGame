/// ds_list_contains_array(id, value)
/// Add an item to a list - unless it already has been added (version for arrays)
/// @param id
/// @param value

//-----------------------------------------------------------------------------

var _id    = argument0;
var _value = argument1;

//-----------------------------------------------------------------------------

var _count = ds_list_size(_id)
for (var i = 0; i < _count; i++) {
	if (array_equals(_id[|i], _value)) {
		return true;
	}
}
return false;

//-----------------------------------------------------------------------------