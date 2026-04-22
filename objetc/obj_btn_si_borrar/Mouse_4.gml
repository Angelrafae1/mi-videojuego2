var _menu    = instance_find(asset_get_index("obj_menu_confirmar"),  0);
var _btn_no  = instance_find(asset_get_index("obj_btn_no_borrar"),   0);
var _overlay = instance_find(asset_get_index("obj_overlay_bloqueo"), 0);

if (_menu == noone || !_menu.activo) exit;

with (obj_GameManager) {
    active_slot = _menu.slot_ref;
    delete_save();
}

_menu.activo   = false;
activo         = false;
_btn_no.activo = false;
if (_overlay != noone) _overlay.activo = false;