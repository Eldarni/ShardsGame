/// scr_log_event(_phrase, ...)

//-----------------------------------------------------------------------------

//only try to process the meesage if the message log exists
if (!instance_exists(obj_history)) {
	return false;
}

//find the phrase in our dictionary
var _phrase = ds_map_find_value(obj_history.phrases, argument[0])

//appy the arguments to the phrase template to get our final string
for (var i = 1; i < argument_count; i++) {
	
	if (is_string(argument[i])) {	
		_phrase = string_replace(_phrase, "%" + string(i), argument[i]);
	}
	else
	{
		_phrase = string_replace(_phrase, "%" + string(i), string(argument[i]));
	}
}

//add the formatted message to the event log
ds_list_add(obj_history.messages, _phrase);

//
return true;

//-----------------------------------------------------------------------------