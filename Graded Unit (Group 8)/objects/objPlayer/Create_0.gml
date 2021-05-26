//creates speed values and gravity value when the object is created
hsp = 0;		// horizontal speed
vsp = 0;		// verical speed
grv = 0.3;		// gravity
walksp = 4;		// walking speed

jump = false;		// tells player that it isnt jumping
can_jump = true;		// allows the player to jump 


tilemap = layer_tilemap_get_id("Tiles");		// tells object which layer to find the tiles for collision