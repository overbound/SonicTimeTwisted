var h_firing = 0;
var v_firing = 0;
var left_rock = shield.left;
var right_rock = shield.right;
if ((left_rock.shot == false && left_rock.broken == false) || (right_rock.shot == false && right_rock.broken == false) )
{
    /*if (input_check(cUP))
    {
        v_firing = -1;
    }
    else if (input_check(cDOWN))
    {
        v_firing = 1;
    }*/
    if (input_check(cLEFT))
    {
        h_firing = -1;
    }
    else if (input_check(cRIGHT))
    {
        h_firing = 1;
    }
    else
    {
        if (v_firing == 0)
        {
            h_firing = facing;
        }
    }
    var which_rock;
    if (shield.rock_alternate)
    {
        if (right_rock.shot == false && right_rock.broken == false)
        {
            which_rock = right_rock;
            shield.rock_alternate *= -1;
        }
        else if (left_rock.shot == false && left_rock.broken == false)
        {
            which_rock = left_rock;
        }
    }
    else
    {
        if (left_rock.shot == false && left_rock.broken == false)
        {
            which_rock = left_rock;
            shield.rock_alternate *= -1;
        }
        else if (right_rock.shot == false && right_rock.broken == false)
        {
            which_rock = right_rock;
        }
    }
    if (which_rock.shot == false)
    {
        which_rock.shot = true;
        if (sign(h_firing) == -1)
        {
            which_rock.hspeed = (4 * h_firing) + xspeed / 2;
        }
        else
        {
            which_rock.hspeed = (6 * h_firing) + xspeed / 2;
        }
        xspeed -= which_rock.hspeed;
        yspeed -= 2;
        which_rock.vspeed = -2;
        which_rock.gravity = 0.21875;
        //which_rock.vspeed = 8 * v_firing;
    }
}
