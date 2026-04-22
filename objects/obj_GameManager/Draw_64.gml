if (ui_message == "") exit;

draw_set_alpha(0.85);
draw_set_color(c_black);
draw_rectangle(10, display_get_gui_height() - 50,
               display_get_gui_width() - 10, display_get_gui_height() - 10, false);
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(display_get_gui_width() / 2, display_get_gui_height() - 30, ui_message);
draw_set_halign(fa_left);
draw_set_valign(fa_top);