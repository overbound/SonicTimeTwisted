///tr_init()

global.TR_map = ds_map_create();
global.TR_lang = "en";
global.TR_sprarr = array_create(7); // this array will hold sprite indexes for custom fonts.
for (var i = 0; i < 7; i++) global.TR_sprarr[i] = -1;

// since font_delete() doesn't automatically free the associated sprite, we have to
// take care of that manually, to prevent a memory leak.
