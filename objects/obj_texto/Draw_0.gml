// Dibuja el sprite del objeto (la barra)
draw_self();

// Dibuja el texto encima del sprite
draw_set_halign(fa_left);
draw_set_color(c_black);
draw_text(x - sprite_width/2 + 10, y - 10, input_name + (activo ? "|" : ""));
draw_set_color(c_white);