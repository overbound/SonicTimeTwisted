/// Write the output in the "console"
// argument0 - String to write
with(objTester)
{
   for(var i = 0; i < 35; i++)
   {
       textRows[i] = textRows[i+1];
   }
   textRows[35] = argument0;
}
