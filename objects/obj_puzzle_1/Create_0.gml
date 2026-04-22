resuelto = false;
verificar = function() {
    if (!layer_get_visible("Puzzle1") || resuelto) exit;
    
    var ok = true;
    with(obj_slot_puzzle) {
        if (layer_get_visible("Puzzle1")) {
            if (!ocupado || pieza_id != pieza_correcta) ok = false;
        }
    }
    if (ok) {
        resuelto = true;
        with(obj_GameManager) puzzle_next(1);
    }
}