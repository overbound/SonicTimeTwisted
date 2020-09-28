if(android_get_mapped_source(0, argument0) == 0)
{
    return android_get_mapped_identifier(0, argument0);
}
else
{
    return android_get_mapped_identifier(0, argument0)*1000;
}
