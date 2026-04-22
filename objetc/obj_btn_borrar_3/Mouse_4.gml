if (obj_overlay_bloqueo.activo) exit;
var _menu    = instance_find(asset_get_index("obj_menu_confirmar"),  0);
var _btn_si  = instance_find(asset_get_index("obj_btn_si_borrar"),   0);
var _btn_no  = instance_find(asset_get_index("obj_btn_no_borrar"),   0);
var _overlay = instance_find(asset_get_index("obj_overlay_bloqueo"), 0);

if (_menu == noone) exit;

var _slot = my_slot;
var _path = "save/save_" + string(_slot) + ".json";

if (file_exists(_path)) {
    _menu.slot_ref   = _slot;
    _menu.activo     = true;
    _btn_si.activo   = true;
    _btn_no.activo   = true;
    if (_overlay != noone) _overlay.activo = true;
} else {
    slot_mensaje = _slot;
    with (obj_GameManager) {
        show_message_ui("Slot " + string(other.slot_mensaje) + " ya esta vacio.");
    }
}