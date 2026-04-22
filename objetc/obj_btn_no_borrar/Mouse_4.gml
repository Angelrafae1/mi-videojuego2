var _menu    = instance_find(asset_get_index("obj_menu_confirmar"),  0);
var _btn_si  = instance_find(asset_get_index("obj_btn_si_borrar"),   0);
var _overlay = instance_find(asset_get_index("obj_overlay_bloqueo"), 0);

if (_menu == noone || !_menu.activo) exit;

_menu.activo   = false;
_btn_si.activo = false;
activo         = false;
if (_overlay != noone) _overlay.activo = false;

with (obj_GameManager) {
    show_message_ui("Borrado cancelado.");
}