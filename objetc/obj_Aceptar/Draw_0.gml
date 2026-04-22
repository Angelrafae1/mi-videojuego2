draw_self();

if (error_msg != "") {
    draw_set_halign(fa_center);
    draw_set_color(c_red);
    draw_text(x, y + sprite_height + 10, error_msg);
    draw_set_color(c_white);
}
