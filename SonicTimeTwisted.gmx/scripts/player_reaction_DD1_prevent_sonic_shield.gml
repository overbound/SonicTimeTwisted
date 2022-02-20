// prevent using the shield
if (objProgram.spawn_tag == 0 && objProgram.cutscene && character_id == 1)
{
    jump_action = false;
}
with argument0 instance_destroy();
return false;
