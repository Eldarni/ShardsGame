/// ds_list_intersect_array(id, id)
/// Performs an intersection of two lists - returns a new list containing only unique values (shared values are not added)
/// @param id
/// @param value

//-----------------------------------------------------------------------------

var _id1 = argument0;
var _id2 = argument1;

//-----------------------------------------------------------------------------

//get the size of our lists
var _id1_size = ds_list_size(_id1) - 1;
var _id2_size = ds_list_size(_id2) - 1;

//iterate over list 1
//	if an value is found in list 2 - delete it from list2
//	if an value is not found in list 2 - add it to list 2
//list 2 is now our intersection

for (var i = 0; i < _id1_size; i++) {
	for (var j = 0; j < _id2_size; j++) {
		
		if (!is_array(_id1[|i])) { show_debug_message("i: " + string(i) + " - " + string(_id1[|i]) + " size: " + string(_id1_size)  ); }
		if (!is_array(_id2[|j])) { show_debug_message("j: " + string(j) + " - " + string(_id2[|j]) + " size: " + string(_id2_size)  ); }
		
		
		if (array_equals(_id1[|i], _id2[|j])) {
			ds_list_delete(_id2, j);
			continue;
		}
	}
	ds_list_add(_id2, _id1[|i]);
}

return _id2;

//-----------------------------------------------------------------------------