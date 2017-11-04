/// show_debug_list(id)

//-----------------------------------------------------------------------------

var _id = argument0;

//-----------------------------------------------------------------------------

var _id_size = ds_list_size(_id) - 1;
show_debug_message("list (" + string(_id_size) + ") {");
for (var i = 0; i < _id_size; i++) {
	show_debug_message("[" + string(i) + "] => '" + string(_id[|i]) + "'");
}
show_debug_message("}");

//-----------------------------------------------------------------------------