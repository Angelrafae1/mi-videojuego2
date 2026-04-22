if (instance_exists(obj_overlay_bloqueo) && obj_overlay_bloqueo.activo) exit;

arrastrando = true;
offset_x = x - mouse_x;
offset_y = y - mouse_y;

if (slot_actual != noone) {
    slot_actual.ocupado = false;
    slot_actual.pieza_id = -1;
    slot_actual = noone;
}