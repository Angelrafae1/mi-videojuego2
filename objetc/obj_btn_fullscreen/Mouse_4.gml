var is_fullscreen = window_get_fullscreen();
window_set_fullscreen(!is_fullscreen);

saved_fullscreen = window_get_fullscreen();

var msg = window_get_fullscreen() ? "PANTALLA COMPLETA" : "VENTANA";
show_message(msg);
