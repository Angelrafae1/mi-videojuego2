draw_self();

var _path = "save/save_1.json";

if (!file_exists(_path)) {
    draw_set_halign(fa_center);
    draw_set_color(c_ltgray);
    draw_text(x, y, "[ Vacío ]");
    draw_set_halign(fa_left);
    exit;
}

var _file = file_text_open_read(_path);
var _json = "";
while (!file_text_eof(_file)) {
    _json += file_text_read_string(_file);
    file_text_readln(_file);
}
file_text_close(_file);

var _data = json_parse(_json);
if (!is_struct(_data)) exit;

var _nombre    = variable_struct_get(_data, "player_name")   ?? "---";
var _genero    = variable_struct_get(_data, "player_gender")  ?? "---";
var _capitulos = variable_struct_get(_data, "chapters_done")  ?? 0;
var _score     = variable_struct_get(_data, "score_total")    ?? 0;

// Centro del sprite
var _cx  = x;
var _gap = 22;

// Altura total del bloque de texto (4 líneas)
var _total_h = _gap * 3;

// Empieza desde arriba del centro para que quede centrado verticalmente
var _sy = y - _total_h / 2;

draw_set_halign(fa_center);

draw_set_color(c_black);
draw_text(_cx, _sy,           "Detective: " + _nombre);

draw_set_color(c_black);
draw_text(_cx, _sy + _gap,    "Genero: " + _genero);

draw_set_color(c_black); 
draw_text(_cx, _sy + _gap*2,  "Capitulos: " + string(_capitulos));

draw_set_color(c_black);
draw_text(_cx, _sy + _gap*3,  "Puntuacion: " + string(_score));

draw_set_halign(fa_left);
draw_set_color(c_white);