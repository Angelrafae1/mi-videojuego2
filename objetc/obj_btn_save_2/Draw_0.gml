/// obj_btn_save_1 — Mouse Left Pressed

var _cx = display_get_gui_width()  / 2;
var _cy = display_get_gui_height() / 2;
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

// Si el panel está abierto, solo procesa el botón CERRAR
if (panel_visible) {
    if (_mx > _cx-70 && _mx < _cx+70 && _my > _cy+78 && _my < _cy+118) {
        panel_visible = false;
    }
    exit;
}

// Acción normal del slot
var _goto_new  = false;
var _goto_menu = false;

with (obj_GameManager) {
    active_slot = 2;

    if (menu_action == "new") {
        _goto_new = true;
    }
    else if (menu_action == "continue") {
        var _ok = load_game_progress();
        if (!_ok) _goto_menu = true;
    }
}

if (_goto_new)  room_goto(rm_crear_credencial);
if (_goto_menu) room_goto(rm_menu_principal);

// Si no navegó a ningún lado y el GameManager cargó bien, muestra el panel
if (!_goto_new && !_goto_menu) {
    if (obj_GameManager.game_loaded) {
        panel_visible = true;
    }
}