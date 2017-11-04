/// ds_grid_floodfill(id, x, y, value)
/// Starting at x and y - flood fill all the cells with the same value with the new value
/// @param id
/// @param x

//-----------------------------------------------------------------------------

var _id    = argument0;
var _x     = argument1;
var _y     = argument2;
var _value = argument3;

//-----------------------------------------------------------------------------

//get the value of the first cell - this will be used to ensure that the cell is valid to be changed
var _old_value = ds_grid_get(_id, _x, _y);

//create a stack to store untested neighbours
var _stack = ds_stack_create();

//puch the starting cell onto the stack
ds_stack_push(_stack, _x, _y);

//keep testing untill the stack is empty
while (ds_stack_size(_stack) > 0) {
	
    var xx = ds_stack_pop(_stack); //this may cause an error when looking at edges @todo - fix this
    var yy = ds_stack_pop(_stack);
	
    if (ds_grid_get(_id, xx, yy) == _old_value) {
        
		ds_grid_set(_id, xx, yy, _value);

        ds_stack_push(_stack, xx + 1, yy);
        ds_stack_push(_stack, xx - 1, yy);
        ds_stack_push(_stack, xx, yy + 1);
        ds_stack_push(_stack, xx, yy - 1);
    }
}


//-----------------------------------------------------------------------------