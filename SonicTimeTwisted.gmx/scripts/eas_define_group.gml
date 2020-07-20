///eas_define_group()
//Used in eas_save and eas_load to define a buffer group.

buffer_async_group_begin(global.EAS_foldername);
buffer_async_group_option("showdialog", global.EAS_showdialog);
buffer_async_group_option("savepadindex", global.EAS_savepadindex);
buffer_async_group_option("slottitle", global.EAS_slottitle);
buffer_async_group_option("subtitle", global.EAS_subtitle);

if ((os_type == os_ps4) && string_count(" ", global.EAS_slottitle))
    eas_error("SLOT TITLES CAN'T HAVE SPACES ON PS4! PLEASE CHANGE THIS!");
