<html>
<body><pre>
<table border="1">
<tr><th>Value</th><th>On/Off Matrix</th><th>Sum</th><th>Shift Matrix</th></tr>
<?php
$matricesForCode = [];
for($i=1;$i<50;$i++)
{
    $onOffMatrix = [];
    for($j=0;$j<50;$j++)
    {
        $onOffMatrix[$j] = 0;
    }
    // do code here
    // spread values around the matrix
    $part = 50.0/$i;
    $previousPartIndex = -1;
    for($j=0;$j<50.0;$j += $part)
    {
        $onOffMatrix[round($j)] = 1;
    }
    //
    $shiftMatrix = [];
    $currentValue = 0;
    $currentValueCounter = 0;
    
    for($cursor = 0; $cursor < 50; $cursor++)
    {
        if($onOffMatrix[$cursor] == $currentValue)
        {
            $currentValueCounter++;
        }
        else
        {
            $shiftMatrix[] = $currentValueCounter;
            $currentValue = $onOffMatrix[$cursor];
            $currentValueCounter = 1;
        }
    }
    if($currentValueCounter)
    {
        $shiftMatrix[] = $currentValueCounter;
    }
    $matricesForCode[$i] = $shiftMatrix;

    $sum = 0;
    for($j=0;$j<50;$j++)
    {
        $sum += $onOffMatrix[$j];
    }

    echo '<tr><td>'.$i.'</td><td>'.implode(',',$onOffMatrix).'</td><td>'.$sum.'</td><td>'.implode(',',$shiftMatrix).'</td></tr>';
}
?>
</table>
<hr />
package ${YYAndroidPackageName};

import android.content.Context;
import android.os.Vibrator;
import java.lang.Thread;

import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;

public class SttAndroidRumble {

    class SttAndroidRumbleThread extends Thread {
        
        private Vibrator v;
        
        private boolean done = false;
        
        private long vibrate_millis;
        
    
        public SttAndroidRumbleThread()
        {
            v = (Vibrator) RunnerJNILib.GetApplicationContext().getSystemService(Context.VIBRATOR_SERVICE);
            done = false;
            vibrate_millis = 0;
        }
        
        public void run() {
            while(!done)
            {
                try
                {
                    switch((int)vibrate_millis)
                    {
                        case 0:
                            sleep(50);
                            break;
<?php
foreach($matricesForCode as $effectiveVibration => $matrix)
{
    $function_is_vibrate = false;
echo '
                        case '.$effectiveVibration.':';
    foreach($matrix as $matrixElement)
    {
        if($matrixElement > 0)
        {
            if($function_is_vibrate)
            {
                echo '
                            v.vibrate('.$matrixElement.');';
            }
            else
            {
                echo '
                            sleep('.$matrixElement.');';
            }
        }
        $function_is_vibrate = !$function_is_vibrate;
    }
echo '
                            break;';
                        }
?>
                        case 50:
                            v.vibrate(50);
                            break;
                    }
                    
                }
                catch(InterruptedException ie)
                {
                    // do nothing
                }
            }
        }
        
        public void setDone(boolean p_done)
        {
            done = p_done;
        }
        
        public void setVibratePower(long p_vibrate_power)
        {
            vibrate_millis = p_vibrate_power;
        }
    }
    
    private SttAndroidRumbleThread thread;

    private Vibrator v;

    public SttAndroidRumble()
    {
        v = (Vibrator) RunnerJNILib.GetApplicationContext().getSystemService(Context.VIBRATOR_SERVICE);
        thread = null;
    }

    public double Init()
    {
        thread = new SttAndroidRumbleThread();
        thread.start();
        return 0.0;
    }

    public double Final()
    {
        if(thread != null)
        {
            try
            {
                thread.setDone(true);
                thread.join();
            }
            catch(InterruptedException ie)
            {
                v.vibrate(0);
            }
        }
        return 0.0;
    }

    public double rumble_perform_android(double arg0)
    {
        if(arg0 > 0.0)
        {
            // the power feels like it scales better with sqrt(arg0) rather than simply arg0
            thread.setVibratePower(Math.round(50.0 * arg0));
        }
        else
        {
            thread.setVibratePower(0);
        }
        return arg0;
    }
}

</pre></body>
</html>