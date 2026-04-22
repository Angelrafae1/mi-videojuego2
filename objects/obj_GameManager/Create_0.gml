// ─── ANTI-DUPLICADO ───────────────────────────────────────────────────────────
if (instance_number(obj_GameManager) > 1) {
    instance_destroy();
    exit;
}

persistent = true;

// ─── SLOT ─────────────────────────────────────────────────────────────────────
active_slot = -1;
menu_action = "new";   // "new" o "continue"

save_paths[1] = "save/save_1.json";
save_paths[2] = "save/save_2.json";
save_paths[3] = "save/save_3.json";

// ─── DATOS DE PARTIDA ─────────────────────────────────────────────────────────
player_name   = "";
player_gender = "";
chapters_done = 0;
score_total   = 0;
fullscreen_on = false;
game_loaded   = false;

// ─── UI MENSAJE TEMPORAL ──────────────────────────────────────────────────────
ui_message       = "";
ui_message_timer = 0;

// ─── FUNCIONES ────────────────────────────────────────────────────────────────

show_message_ui = function(_msg, _steps = 180) {
    ui_message       = _msg;
    ui_message_timer = _steps;
};

get_save_path = function() {
    if (active_slot < 1 || active_slot > 3) {
        show_message_ui("Error: no hay slot seleccionado.");
        return "";
    }
    return save_paths[active_slot];
};

setup_complete = function(_name, _gender) {
    player_name   = _name;
    player_gender = _gender;
    chapters_done = 0;
    score_total   = 0;
    fullscreen_on = false;
    game_loaded   = true;
    save_game_progress();
};

save_game_progress = function() {
    var _path = get_save_path();
    if (_path == "") return false;

    var _data = {
        player_name   : player_name,
        player_gender : player_gender,
        chapters_done : chapters_done,
        score_total   : score_total,
        fullscreen_on : fullscreen_on
    };

    var _json = json_stringify(_data);
    var _file = file_text_open_write(_path);
    if (_file < 0) {
        show_message_ui("No se pudo guardar el archivo.");
        return false;
    }
    file_text_write_string(_file, _json);
    file_text_close(_file);
    show_message_ui("Partida guardada en Slot " + string(active_slot) + ".");
    return true;
};

load_game_progress = function() {
    var _path = get_save_path();
    if (_path == "") return false;

    if (!file_exists(_path)) {
        show_message_ui("Slot " + string(active_slot) + " vacio. Crea una partida primero.");
        return false;
    }

    var _file = file_text_open_read(_path);
    if (_file < 0) {
        show_message_ui("No se pudo leer el archivo.");
        return false;
    }

    var _json = "";
    while (!file_text_eof(_file)) {
        _json += file_text_read_string(_file);
        file_text_readln(_file);
    }
    file_text_close(_file);

    var _data = json_parse(_json);
    if (!is_struct(_data)) {
        show_message_ui("Archivo de guardado corrupto.");
        return false;
    }

    player_name   = variable_struct_get(_data, "player_name")   ?? "";
    player_gender = variable_struct_get(_data, "player_gender")  ?? "";
    chapters_done = variable_struct_get(_data, "chapters_done")  ?? 0;
    score_total   = variable_struct_get(_data, "score_total")    ?? 0;
    fullscreen_on = variable_struct_get(_data, "fullscreen_on")  ?? false;
    game_loaded   = true;

    if (fullscreen_on) window_set_fullscreen(true);
    show_message_ui("Partida de '" + player_name + "' cargada.");
    return true;
};

save_on_exit = function() {
    if (game_loaded && active_slot != -1) {
        save_game_progress();
    }
    game_end();
};

delete_save = function() {
    var _path = get_save_path();
    if (_path == "") return false;

    if (!file_exists(_path)) {
        show_message_ui("Slot " + string(active_slot) + " ya esta vacio.");
        return false;
    }

    file_delete(_path);

    player_name   = "";
    player_gender = "";
    chapters_done = 0;
    score_total   = 0;
    fullscreen_on = false;
    game_loaded   = false;

    show_message_ui("Slot " + string(active_slot) + " borrado.");
    active_slot = -1;
    return true;
};