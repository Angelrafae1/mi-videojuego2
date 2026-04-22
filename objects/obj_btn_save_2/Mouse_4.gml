if (obj_overlay_bloqueo.activo) exit;
var _goto_new  = false;
var _goto_menu = false;

with (obj_GameManager) {
    active_slot = 2;
    if (menu_action == "new") {
        if (file_exists(save_paths[2])) {
            show_message_ui("Este slot ya tiene una partida. Borrala primero.");
        } else {
            _goto_new = true;
        }
    }
    else if (menu_action == "continue") {
        var _ok = load_game_progress();
        if (!_ok) _goto_menu = true;
    }
}

if (_goto_new)  room_goto(rm_crear_credencial);
if (_goto_menu) room_goto(rm_menu_principal);