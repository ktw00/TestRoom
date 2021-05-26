var bbox_side;

//movement controls
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check(vk_space);


//determines direction from inputs and moves the player in that direction
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;



//Jump Logic
if key_jump && jump==false		// Checks if the player is pressing the jump button, and that it isnt already jumping
{if can_jump == true		// checks if the jump cooldown is over
	{
	vsp = -10       // Makes the player jump
	jump=true;            // Flags that the player is jumping
	can_jump = false;		// 
	alarm[0] = 60		// Resets cooldown timer
	}
}


// Flags if you are no longer jumping
if (tilemap_get_at_pixel(tilemap,bbox_left,bbox_bottom+ceil(vsp)) != 0) || (tilemap_get_at_pixel(tilemap,bbox_right,bbox_bottom+ceil(vsp)) != 0)		// Checks if you are on(or 1 frame away from) a tile 
	{
	jump = false		// Flags that you aren't jumping anymore
	}




//Horizontal Collision
if (hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;		// tells the player which side to check depending on if you are moving a a pos/neg direction
if (tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_top) != 0) || (tilemap_get_at_pixel(tilemap,bbox_side+hsp,bbox_bottom) != 0)		// Checks if you are on(or 1 frame away from) a tile 
	{
	if (hsp > 0) x = x - (x mod 32) + 31 - (bbox_right - x);		// snaps the player to directly on/next to the tile
	else x = x - (x mod 32) - (bbox_left - x)		// 
	hsp = 0		// sets horizontal movement spd to 0
	}
 
x = x + hsp;		// moves players horizontal axis



//Vertical Collision
if (vsp > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;		// tells the player which side to check depending on if you are moving a a pos/neg direction
if (tilemap_get_at_pixel(tilemap,bbox_left,bbox_side+ceil(vsp)) != 0) || (tilemap_get_at_pixel(tilemap,bbox_right,bbox_side+ceil(vsp)) != 0)		// Checks if you are on(or 1 frame away from) a tile 
 {
	if (vsp < 0) y = y - (y mod 32) + 31 - (bbox_bottom - y);		// snaps the player to directly on/next to the tile
	else y = y - (y mod 32) - (bbox_top - y)
	vsp = 0		// sets vertical movement spd to 0
 }
 
y = y + vsp;		// moves players verical axis