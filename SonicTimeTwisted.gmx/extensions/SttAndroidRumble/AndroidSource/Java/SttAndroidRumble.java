package ${YYAndroidPackageName};

import android.content.Context;
import android.os.Vibrator;

import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;

public class SttAndroidRumble {

    private Vibrator v;

    public SttAndroidRumble()
    {
        v = (Vibrator) RunnerJNILib.GetApplicationContext().getSystemService(Context.VIBRATOR_SERVICE);
    }

    public double rumble_perform_android(double arg0)
    {
        if(arg0 > 0.0)
		{
			v.vibrate(Math.round(30.0 * arg0));
		}
		return arg0;
    }
}
