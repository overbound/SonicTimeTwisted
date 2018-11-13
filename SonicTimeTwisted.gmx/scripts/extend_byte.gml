// extend_byte(byte)
if (argument0 & $80)
  argument0 |= ~$FF;
return argument0;
