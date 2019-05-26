// if a save 0 exists, it means that the game has been previously played using a 
// version that didn't have the "No Save" slot yet.
// In this case, shift all save files to the right.
var zeroFilename = save_file_name(0);
if(file_exists(zeroFilename))
{
    // if a save file somehow exists at the very end, then it will be deleted, unfortunately
    var lastFilename = save_file_name(7);
    if(file_exists(lastFilename))
    {
        file_delete(lastFilename);
    }
    // we are shifting everything!
    for(var i = 6; i >= 0; i--)
    {
        if(file_exists(save_file_name(i)))
        {
            file_rename(save_file_name(i), save_file_name(i+1));
        }
    }
}
