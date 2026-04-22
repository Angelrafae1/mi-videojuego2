if (seleccionado) {
    draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, make_color_rgb(100,180,255), 1);
} else {
    draw_self();
}