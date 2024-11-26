/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
global.P_System = part_system_create_layer("Instances", false);
global.Particle1 = part_type_create();

part_type_shape(global.Particle1, pt_shape_square);
part_type_size(global.Particle1, 2, 2, 1, 2);
part_type_color1(global.Particle1, c_white);
part_type_alpha1(global.Particle1, 1);
part_type_speed(global.Particle1, 5, 10, 0, 0);
part_type_direction(global.Particle1, 0, 359,0 ,0);
part_type_orientation(global.Particle1, 0, 0, 0, 0, true );
part_type_blend(global.Particle1, 1);
part_type_life(global.Particle1, 5, 30);