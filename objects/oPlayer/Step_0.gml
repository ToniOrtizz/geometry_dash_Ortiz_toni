// Constant horizontal movement to the right
move_x = move_speed; // Always moving right at constant speed

// Check if a collision has already occurred
if (!collision_occurred) {

    // Check if on the ground
    if (place_meeting(x, y+2, solid_tilemap)) {
        // Reset vertical movement and rotation when on the ground
        move_y = 0;
        image_angle = 0; // Reset rotation to upright
        is_in_air = false; // Player is on the ground

        // Jump if the space key is pressed
        if (keyboard_check(vk_space)) {
            move_y = -jump_speed;
            is_in_air = true; // Set flag to indicate the player is in the air
        }
    } else {
        // Apply gravity if not on the ground
        if (move_y < 10) move_y += 1;

        // Rotate the player only once per jump while in the air
        if (is_in_air) {
            image_angle -= 10; // Adjust rotation speed for counterclockwise rotation
        }
    }

    // Slope handling check
    if (!place_meeting(x + move_x, y + 2,solid_tilemap) && place_meeting(x + move_x, y + 10, oGround)) {
        move_y = abs(move_x); // Adjust vertical movement to match slope
        move_x = 0; // Stop horizontal movement for smooth slope transition
    }
	
	

    // Check for horizontal collision
    if (place_meeting(x + move_x, y, solid_tilemap)) {
        // Stop movement on collision
        move_x = 0;
        move_y = 0;
        collision_occurred = true; // Set collision flag
		audio_stop_sound(Sound1);		
		

        // Set alarm to restart after 1 second (assuming 60 FPS)
        alarm[0] = 60;
		visible = false;
		part_particles_create(global.P_System, x, y, global.Particle1, 25 )
    } else {
        // Move normally if no collision
        move_and_collide(move_x, move_y, solid_tilemap);
    }

    // Adjust sprite direction (always facing right)
    image_xscale = 1;
	if (y > room_height) {
		alarm[0] = 60;
		part_particles_create(global.P_System, x, y, global.Particle1, 25);
		collision_occurred = true;
		visible = false;
		audio_stop_sound(Sound1);
		
	}
}
/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
