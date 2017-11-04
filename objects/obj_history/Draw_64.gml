//get a count of the messages
var message_count = ds_list_size(messages);

//show "more" logged items when b is held down
var show_messages = (keyboard_check(ord("B")) == true) ? 50 : 20;

//show the latest 20 messages
for (var i = 0; i < min(message_count, show_messages); i++) {
	draw_text(16, 48 + (14 * i), ds_list_find_value(messages, (message_count - 1) - i));
}