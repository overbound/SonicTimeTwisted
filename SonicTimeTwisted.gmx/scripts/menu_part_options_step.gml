var allow_default = true;
if(instance_exists(objTitleControl))
{
    allow_default = objTitleControl.state != 4;
}
if(allow_default)
{
    menu_fn_step_default();
}

