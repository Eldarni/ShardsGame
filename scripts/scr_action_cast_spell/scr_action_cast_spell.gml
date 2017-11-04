if (obj_game.current_entity > 0 and instance_exists(obj_game.current_entity)) {
	obj_game.current_entity.action = "cast-magic-arrow";
	obj_mouse.pointer_type = enum_pointer_type.aim;
}