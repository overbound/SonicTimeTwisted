// argument0 - current value
// the same value (altered if need be) is also returned
confirmation_cursor = argument0;
if(temporary_variable != -1)
{
    confirmation_cursor = temporary_variable;
    temporary_variable = -1;
} 
return confirmation_cursor;
