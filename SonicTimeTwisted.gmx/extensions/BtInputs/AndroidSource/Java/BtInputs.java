package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;
import fr.khayrullin.alex.gmsbtinputs.Inputs;

// use this as the GMS extension base file
public class BtInputs extends Inputs implements IExtensionBase
{
	public void Init()
	{
		System.out.println("Initializing devices...");
		this.refreshDevices();
		System.out.println("Devices initialized");
	}
}
