//argument0 - script to run when menu closes
//argument1 - argument8 : arguments
next_item_script = argument[0]; // not an items script, just reusing the variable...

next_cursor = ds_list_create();
if(argument_count > 1)
{
    switch(argument_count)
    {
        case 2:
            ds_list_add(next_cursor, argument[1]);
            break;
        case 3:
            ds_list_add(next_cursor, argument[1]);
            ds_list_add(next_cursor, argument[2]);
            break;
        case 4:
            ds_list_add(next_cursor, argument[1]);
            ds_list_add(next_cursor, argument[2]);
            ds_list_add(next_cursor, argument[3]);
            break;
        case 5:
            ds_list_add(next_cursor, argument[1]);
            ds_list_add(next_cursor, argument[2]);
            ds_list_add(next_cursor, argument[3]);
            ds_list_add(next_cursor, argument[4]);
            break;
        case 6:
            ds_list_add(next_cursor, argument[1]);
            ds_list_add(next_cursor, argument[2]);
            ds_list_add(next_cursor, argument[3]);
            ds_list_add(next_cursor, argument[4]);
            ds_list_add(next_cursor, argument[5]);
            break;
        case 7:
            ds_list_add(next_cursor, argument[1]);
            ds_list_add(next_cursor, argument[2]);
            ds_list_add(next_cursor, argument[3]);
            ds_list_add(next_cursor, argument[4]);
            ds_list_add(next_cursor, argument[5]);
            ds_list_add(next_cursor, argument[6]);
            break;
        case 8:
            ds_list_add(next_cursor, argument[1]);
            ds_list_add(next_cursor, argument[2]);
            ds_list_add(next_cursor, argument[3]);
            ds_list_add(next_cursor, argument[4]);
            ds_list_add(next_cursor, argument[5]);
            ds_list_add(next_cursor, argument[6]);
            ds_list_add(next_cursor, argument[7]);
            break;
        case 9:
            ds_list_add(next_cursor, argument[1]);
            ds_list_add(next_cursor, argument[2]);
            ds_list_add(next_cursor, argument[3]);
            ds_list_add(next_cursor, argument[4]);
            ds_list_add(next_cursor, argument[5]);
            ds_list_add(next_cursor, argument[6]);
            ds_list_add(next_cursor, argument[7]);
            ds_list_add(next_cursor, argument[8]);
            break;
    }
}


timer = 0;
state = 4;

with(objProgram.inputManager)
{
    use_fallback = false;
    visible = true;
}

