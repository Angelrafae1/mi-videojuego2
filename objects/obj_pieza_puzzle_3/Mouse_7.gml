arrastrando = false;
var _soltado_en_slot = false;

with (obj_slot_puzzle) {
    if (mouse_x > x-40 && mouse_x < x+40 &&
        mouse_y > y-20 && mouse_y < y+20 && !ocupado) {
        other.x = x;
        other.y = y;
        other.slot_actual = id;
        ocupado = true;
        pieza_id = other.id_pieza;
        _soltado_en_slot = true;
        break;
    }
}

if (!_soltado_en_slot) {
    x = origen_x;
    y = origen_y;
}

with (obj_puzzle_1) verificar();
with (obj_puzzle_2) verificar();
with (obj_puzzle_3) verificar();