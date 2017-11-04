/// getCellAtMouse()
/// Calculates the cell that is under the mouse cursor

//-----------------------------------------------------------------------------

//calculate the current "game" position for the mouse cursor
var _target_x = floor(mouse_x / GRID_SIZE);
var _target_y = floor(mouse_y / GRID_SIZE);

return [_target_x, _target_y];

//-----------------------------------------------------------------------------