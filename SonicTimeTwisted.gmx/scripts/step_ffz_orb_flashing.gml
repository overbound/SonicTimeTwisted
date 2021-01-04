orb_flashing_alpha = orb_flashing_alpha + 0.1;
if(orb_flashing_alpha >= 1)
{
    orb_flashing_alpha = orb_flashing_alpha - 1;
    orb_flashing_image_index = (orb_flashing_image_index + 1) mod 9;
    orb_flashing_next_image_index = (orb_flashing_next_image_index + 1) mod 9;
}
