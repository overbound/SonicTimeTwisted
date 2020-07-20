///eas_perform_async()

// If you're using this extension in GMS2, please don't forget to uncomment the line-
// in switch-case EASYASYNC_STATE.SAVING below!

var _ident = ds_map_find_value(async_load, "id");
var _status = ds_map_find_value(async_load, "status");
var _error = ds_map_find_value(async_load, "error");
var _err = ((!_status) && (_error != 0)); //if status is false, and error does not equal to 0.

if (_err) //oh no.
{
    eas_error("Error in Async Save / Load event has occured. Status: " + string(_status) + " Error code: " + string(_error));
    exit;
}

if (_ident == global.EAS_id)
{
    switch (global.EAS_state)
    {
        case EASYASYNC_STATE.LOADING:
        {
            eas_log("Got load async event...");
            //buffer_seek(global.EAS_buffer, buffer_seek_start, 0);
            var _string = buffer_read(global.EAS_buffer, buffer_string);
            var _newmap = json_decode(_string);
            if (_newmap != -1)
            {
                ds_map_destroy(global.EAS_map);
                global.EAS_map = _newmap;
            }
            else
            {
                eas_log("WARNING: Invalid json OR the file does not exist.");
            }
            
            buffer_delete(global.EAS_buffer);
            if (script_exists(global.EAS_callbackscript)) script_execute(global.EAS_callbackscript, _ident, _err);
            else eas_log("MSG: Invalid script or it was not passed to eas_load() (it's not an error or a warning!)");
            
            global.EAS_state = EASYASYNC_STATE.IDLE;
            eas_log("Load event OK");
            
            break;
        }
        
        case EASYASYNC_STATE.SAVING:
        {
            eas_log("Got save async event...");
            buffer_delete(global.EAS_buffer);
            //   uncomment the line below in GMS2!!!
            //switch_save_data_commit(); // uncomment me if you're using this extension in GMS2!!!
            // ^ uncomment the line above in GMS2!!!
            if (script_exists(global.EAS_callbackscript)) script_execute(global.EAS_callbackscript, _ident, _err);
            else eas_log("MSG: Invalid script or it was not passed to eas_save() (it's not an error or a warning!)");
            
            global.EAS_state = EASYASYNC_STATE.IDLE;
            eas_log("Save event OK");
            
            break;
        }
        
        default:
        {
            eas_log("Invalid EasyAsync state.");
            break;
        }
    }
}
