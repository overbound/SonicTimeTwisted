///eas_init()

enum EASYASYNC_STATE
{
    IDLE,
    LOADING,
    SAVING
}

//Options (customize them to your liking)
global.EAS_filename = "save.dat"; // Filename.
global.EAS_slottitle = "Savedata"; // Slot title. (CAN'T CONTAIN SPACES ON PLAYSTATION 4!)
global.EAS_subtitle = "Sonic Time Twisted - Save Data"; // Sub title in Console UI.
global.EAS_showdialog = false; // Show slot selection dialog? (only valid for PlayStation?)
global.EAS_savepadindex = 0; // Force writing to slot 0. (Although you can write to slot 1, 2, 3 just fine,
//but it's recommended to enable EAS_showdialog if you want to write to a slot that's not 0)
global.EAS_foldername = "STTSavedata";
//(only valid for PC) name of the folder where files will be saved to. (example: %LOCALAPPDATA%\{project_name}\{EAS_foldername}\{EAS_filename})


//Main initialization stuff.
global.EAS_map = ds_map_create(); // DS Map where all your files are located.
global.EAS_id = undefined; // Async id.
global.EAS_buffer = undefined; // Buffer.
global.EAS_callbackscript = noone; // A variable that is used for storing callback script.
global.EAS_state = EASYASYNC_STATE.IDLE; // EAS_state is not IDLE only in callback scripts.
global.EAS_needasync =
    (
        //Regular consoles, nothing interesting.
        (os_type == os_psvita)  ||
        (os_type == os_ps4)     ||
        (os_type == os_ps3)     ||
        (os_type == os_xboxone) ||
        
        (os_type == os_uwp)     // surprisingly, https://help.yoyogames.com/hc/en-us/articles/360031122031-UWP-Saving-And-Loading-When-Targeting-Xbox
    );
//You can use this variable to check what file functions you should use, normal or EasyAsync ones.
//(since 2.1 EasyAsync will automatically pick the best file functions for you)

//INI stuff
global.EAS_ini = false;  // do we have an ini open?
global.EAS_ininame = ""; // current ini name
global.EAS_inidata = ""; // current ini data as a big string
global.EAS_iniempty = false;

//PC fix.
if (!global.EAS_needasync)
{
 global.EAS_state = EASYASYNC_STATE.LOADING;
 scr_easyasync_callback(-1, -1);
 global.EAS_state = EASYASYNC_STATE.IDLE;
}

//If this message appears then all went fine.
eas_log("EasyAsync version 2.2 initialized!");
