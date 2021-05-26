var bbox_side;

//movement controls
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check(vk_space);


//determines direction from inputs and moves the player in that direction
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;




//Horizontal Collision
if (hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
if (tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_top) != 0) || (tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_bottom) != 0)
 {
	 //snaps the player to the offset of the tile width
	if (hsp > 0) x = x - (x mod 32) + 31 - (bbox_right - x);
	else x = x - (x mod 32) - (bbox_left - x)
	hsp = 0
 }
 
x = x + hsp;



//Vertical Collision
if (vsp > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
if (tilemap_get_at_pixel(tilemap,bbox_left,bbox_side+ceil(vsp)) != 0) || (tilemap_get_at_pixel(tilemap,bbox_right,bbox_side+ceil(vsp)) != 0)
 {
	 //snaps the player to the offset of the tile height
	if (vsp < 0) y = y - (y mod 32) + 31 - (bbox_bottom - y);
	else y = y - (y mod 32) - (bbox_top - y)
	vsp = 0
 }
 
y = y + vsp;