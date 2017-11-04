//keep track where the cursor is
current_x = 0;
current_y = 0;

//
entity = noone;

//what cursor to use
enum enum_pointer_type {
	pointer,
	move,
	aim,
}

//
pointer_type     = enum_pointer_type.pointer;

pointer_types[0] = spr_mousePointer;
pointer_types[1] = spr_mouseMove;
pointer_types[2] = spr_mouseAim;