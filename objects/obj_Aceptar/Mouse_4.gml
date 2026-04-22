error_msg = "";

var _nombre = string_trim(keyboard_string);
var _genero = obj_fotografia.genero_actual;

if (string_length(_nombre) == 0) {
    error_msg = "Escribe un nombre.";
    exit;
}
if (_genero == "") {
    error_msg = "Selecciona un genero.";
    exit;
}

nombre_final = _nombre;
genero_final = _genero;

with (obj_GameManager) {
    player_name   = other.nombre_final;
    player_gender = other.genero_final;
    game_loaded   = true;
    save_game_progress();
    show_message_ui("'" + other.nombre_final + "' creado en Slot " + string(active_slot) + ".");
}

room_goto(rm_gameplay);