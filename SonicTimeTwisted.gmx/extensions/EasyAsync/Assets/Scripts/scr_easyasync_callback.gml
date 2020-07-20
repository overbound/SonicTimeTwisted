///scr_easyasync_callback(id, err)
var _EAS_id = argument0;
var _EAS_err = argument1;
//Available variables:
// _EAS_id - async event id (number)
// _EAS_err - if error occured when saving/loading (true/false)
// global.EAS_state - can be EASYASYNC_STATE.LOADING or EASYASYNC_SAVING. (enum value)
//Available scripts:
// eas_log - Allows you to log stuff at EasyAsync level.

eas_log("Callback: Hi from scr_easyasync_callback() !");
eas_log("Callback state: " + eas_enum_to_string(global.EAS_state));

eas_log("Callback variables: ID(" + string(_EAS_id) + ") ERR(" + string(_EAS_err) + ")");
eas_log("Callback: Goodbye!");

return _EAS_err;
